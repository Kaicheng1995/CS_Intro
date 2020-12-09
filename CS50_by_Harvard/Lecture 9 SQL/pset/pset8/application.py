import os

from cs50 import SQL
from flask import Flask, flash, jsonify, redirect, render_template, request, session, url_for
from flask_session import Session
from tempfile import mkdtemp
from werkzeug.exceptions import default_exceptions, HTTPException, InternalServerError
from werkzeug.security import check_password_hash, generate_password_hash

from helpers import apology, login_required, lookup, usd

# Configure application
app = Flask(__name__)

# Ensure templates are auto-reloaded
app.config["TEMPLATES_AUTO_RELOAD"] = True

# Ensure responses aren't cached
@app.after_request
def after_request(response):
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    response.headers["Expires"] = 0
    response.headers["Pragma"] = "no-cache"
    return response

# Custom filter
app.jinja_env.filters["usd"] = usd

# Configure session to use filesystem (instead of signed cookies)
app.config["SESSION_FILE_DIR"] = mkdtemp()
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

# Configure CS50 Library to use SQLite database
db = SQL("sqlite:///finance.db")

# Make sure API key is set
if not os.environ.get("API_KEY"):
    raise RuntimeError("API_KEY not set")

# TO DOs starts here
""" step4 """
@app.route("/")
@login_required
def index():
    # look up the current user
    users = db.execute("SELECT cash FROM users WHERE id = :user_id", user_id=session["user_id"])

    # 下面这些步骤没看懂？？大概是选了symbol，shares求和运算。GROUP BY是什么意思？
    stocks = db.execute("SELECT symbol, SUM(shares) as total_shares FROM transactions WHERE user_id = :user_id GROUP BY symbol HAVING total_shares > 0", user_id=session["user_id"])
    quotes = {}

    for stock in stocks:
        quotes[stock["symbol"]] = lookup(stock["symbol"])

    cash_remaining = users[0]["cash"]
    total = cash_remaining

    # home page
    return render_template("portfolio.html", quotes=quotes, stocks=stocks, total=total, cash_remaining=cash_remaining)


""" step3 """
@app.route("/buy", methods=["GET", "POST"])
@login_required
def buy():
    if request.method == "POST":
        quote = lookup(request.form.get("symbol"))

        # check if the symbol exists
        if not quote:
            return apology("Invalid symbol!", 400)

        # check1: if shares is a integer (change it into int and see if it breaks)
        try:
            shares = int(request.form.get("shares"))
        except:
            return apology("Shares must be a positive integer", 400)

        # check2: if shares is a positive number
        if shares <= 0:
            return apology("Can't buy less than or 0 shares", 400)

        # IF ALL ABOVE SUCCESSFUL, we can select CASH.
        rows = db.execute("SELECT cash FROM users WHERE id = :user_id", user_id=session["user_id"])

        # how much money still in the user's account (cash这里没看懂)
        cash_remaining = rows[0]["cash"]
        price_per_share = quote["price"]

        # caluculate the price of requested shares
        total_price = price_per_share * shares

        # check3 : if enough money
        if total_price > float(cash_remaining):
            return apology("Not enough funds!")

        # if money is enough, keep buying
        else:
            # UPDATE cash left
            db.execute("UPDATE users SET cash = cash - :price WHERE id = :user_id", price=total_price, user_id=session["user_id"])
            # UPDATE transaction
            db.execute("INSERT INTO transactions (user_id, symbol, shares, price_per_share) VALUES(:user_id, :symbol, :shares, :price)",
                       user_id=session["user_id"],
                       symbol=request.form.get("symbol"),
                       shares=shares,
                       price=usd(price_per_share))

            flash("Bought!")

            # if bought successfully, return to home page
            return redirect("/")

    else:
        return render_template("buy.html")


@app.route("/check", methods=["POST"])
def check():
    """Return true if username available, else false, in JSON format"""
    username = request.form.get("username")

    taken_usernames = db.execute("SELECT username FROM users")

    if not len(str(username)) > 0:
        return jsonify(False)
    for taken_username in taken_usernames:
        if username == taken_username["username"]:
            return jsonify(False)


@app.route("/history")
@login_required
def history():
    transactions = db.execute("SELECT symbol, shares, price_per_share, transacted FROM transactions WHERE user_id = :user_id ORDER BY transacted ASC", user_id=session["user_id"])

    return render_template("history.html", transactions=transactions)


@app.route("/login", methods=["GET", "POST"])
def login():
    """Log user in"""

    # Forget any user_id
    session.clear()

    # User reached route via POST (as by submitting a form via POST)
    if request.method == "POST":

        # Ensure username was submitted
        if not request.form.get("username"):
            return apology("must provide username", 403)

        # Ensure password was submitted
        elif not request.form.get("password"):
            return apology("must provide password", 403)

        # Query database for username
        rows = db.execute("SELECT * FROM users WHERE username = :username",
                          username=request.form.get("username"))

        # Ensure username exists and password is correct
        if len(rows) != 1 or not check_password_hash(rows[0]["hash"], request.form.get("password")):
            return apology("invalid username and/or password", 403)

        # Remember which user has logged in
        session["user_id"] = rows[0]["id"]

        # Redirect user to home page
        return redirect("/")

    # User reached route via GET (as by clicking a link or via redirect)
    else:
        return render_template("login.html")


@app.route("/logout")
def logout():
    """Log user out"""

    # Forget any user_id
    session.clear()

    # Redirect user to login form
    return redirect("/")

""" step2 """
@app.route("/quote", methods=["GET", "POST"])
@login_required
def quote():
    if request.method == "POST":

        # look up sumbol (by using lookup function defined in helpers.py)
        # quote is a DICTIONARY!!
        quote = lookup(request.form.get("symbol"))
        if not quote:
            return apology("Invalid symbol!", 400)

        # if symbol exists
        else:
            return render_template("quoted.html", quote=quote)

    # if nothing above like happens, just stay
    else:
        return render_template("quote.html")


""" step1 """
@app.route("/register", methods=["GET", "POST"])
def register():
    if request.method == "POST":

        # make sure username was filled
        if not request.form.get("username"):
            return apology("Must provide username!", 400)

        # make sure password was filled
        elif not request.form.get("password"):
            return apology("Must provide password!", 400)

        # make sure password matches confirmation
        elif not request.form.get("password") == request.form.get("confirmation"):
            return apology("passwords do not match", 400)

        # hash the password (for security purpose?)
        hash = generate_password_hash(request.form.get("password"))

        # insert a new user into database
        new_user_id = db.execute("INSERT INTO users (username, hash) VALUES(:username, :hash)",
                                 username=request.form.get("username"), hash = hash)

        # check duplicate (facing problems when inserting)
        if not new_user_id:
            return apology("Username has been taken!", 400)

        # remember which user has logged in (saved to session)
        session["user_id"] = new_user_id

        # if all successful, return to home page
        return redirect("/")

    # if nothing like above, just return to same page
    else:
        return render_template("register.html")



""" step5 """
@app.route("/sell", methods=["GET", "POST"])
@login_required
def sell():
    if request.method == "POST":
        quote = lookup(request.form.get("symbol"))

        # Check if the symbol exists
        if not quote:
            return apology("invalid symbol", 400)

        # Check if shares was a integer
        try:
            shares = int(request.form.get("shares"))
        except:
            return apology("shares must be a positive integer", 400)

        # Check if shares is positive
        if shares <= 0:
            return apology("can't sell less than or 0 shares", 400)

        # Check if we have enough shares (len(stock)没看懂)
        stock = db.execute("SELECT SUM(shares) as total_shares FROM transactions WHERE user_id = :user_id AND symbol = :symbol GROUP BY symbol",
                           user_id=session["user_id"], symbol=request.form.get("symbol"))

        if len(stock) != 1 or stock[0]["total_shares"] <= 0 or stock[0]["total_shares"] < shares:
            return apology("you can't sell less than 0 or more than you own", 400)

        # Query database for username
        rows = db.execute("SELECT cash FROM users WHERE id = :user_id", user_id=session["user_id"])

        # How much $$$ the user still has in her account
        cash_remaining = rows[0]["cash"]
        price_per_share = quote["price"]

        # Calculate the price of requested shares
        total_price = price_per_share * shares

        # Book keeping (TODO: should be wrapped with a transaction)
        db.execute("UPDATE users SET cash = cash + :price WHERE id = :user_id", price=total_price, user_id=session["user_id"])
        db.execute("INSERT INTO transactions (user_id, symbol, shares, price_per_share) VALUES(:user_id, :symbol, :shares, :price)",
                   user_id=session["user_id"],
                   symbol=request.form.get("symbol"),
                   shares=-shares,
                   price=price_per_share)

        flash("Sold!")

        return redirect("/")

    else:
        # 这步是什么鬼？？
        stocks = db.execute("SELECT symbol, SUM(shares) as total_shares FROM transactions WHERE user_id = :user_id GROUP BY symbol HAVING total_shares > 0", user_id=session["user_id"])

        return render_template("sell.html", stocks=stocks)



def errorhandler(e):
    """Handle error"""
    if not isinstance(e, HTTPException):
        e = InternalServerError()
    return apology(e.name, e.code)


# Listen for errors
for code in default_exceptions:
    app.errorhandler(code)(errorhandler)
