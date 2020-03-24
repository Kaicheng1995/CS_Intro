from flask import Flask, render_template, request
import csv

app = Flask(__name__)


@app.route("/")
def index():
    return render_template("index.html")

@app.route("/register", methods=["POST"])
def register():
    name = request.form.get("name")
    dorm = request.form.get("dorm")
    if not name or not dorm:
        return render_template("submit-failure.html")
    file = open("registered.csv","a")
    writer = csv.writer(file)        #create csv file and write to "file"
    writer.writerow((request.form.get("name"), request.form.get("doem")))   # a tuple
    file.close()
    return render_template("submit_success.html")