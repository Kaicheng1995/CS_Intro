from flask import Flask, render_template, request
import csv

app = Flask(__name__)

students = []

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/register", methods=["POST"])
def register():
    name = request.form.get("name")
    dorm = request.form.get("dorm")
    if not name or not dorm:
        return render_template("submit-failure.html")
    file = open("registered.csv","a") # open file (append)
    writer = csv.writer(file)        # write file
    writer.writerow((request.form.get("name"), request.form.get("doem")))   # write into a tuple
    file.close()
    return render_template("submit_success.html")

@app.route("/registered")
def registered():
    file = open("registered.csv","r")  # open file (read)
    reader = csv.reader(file)       # read file
    students = list(reader)        # turn file into a list
    file.close()
    return render_template("registered.html", students = students)