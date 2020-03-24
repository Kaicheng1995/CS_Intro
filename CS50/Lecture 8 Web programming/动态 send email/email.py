import os        # did not explain in lecture
import smtplib    # simple mail transfer protocol
from flask import Flask, render_template, request

app = Flask(__name__)

#create a list for registered students
students = []

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/register", methods=["POST"])
def register():
    name = request.form.get("name")
    dorm = request.form.get("dorm")
    email = request.form.get("email")
    if not name or not dorm or not email:
        return render_template("submit-failure.html")
    message = "You are registered!"                 # The email message
    server = smtplib.SMTP("smtp.gmail.com", 587)    # The server used for sending email, 587 is unique for gmail
    server.starttls()    #turn on the encrption
    server.login("jharvard@cs50.net", os.getenv("PASSWORD"))  # login in account, the PASSWORD should be real here
    server.sendmail("jharvard@cs50.net", email, message)  #from, to, content
    return render_template("submit_success.html")