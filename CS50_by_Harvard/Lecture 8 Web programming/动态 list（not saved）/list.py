from flask import Flask, render_template, request

app = Flask(__name__)

#create a list for registered students
students = []

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/registraints")
def registraints():
    return render_template("registered.html",students=students)     #1st students is variable, 2nd is list

@app.route("/register", methods=["POST"])
def register():
    name = request.form.get("name")
    dorm = request.form.get("dorm")
    if not name or not dorm:
        return render_template("submit-failure.html")
    students.append(f"{name} from {dorm}")        #name and dorm are just variables
    return redirect("/registrants")               # /registrants is the 3rd route

