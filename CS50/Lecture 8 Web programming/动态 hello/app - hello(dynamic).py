from flask import Flask, render_template, request

app = Flask(__name__)

@app.route("/")
def index():

    #get argument value from user, input means user input
    X = request.args.get("input","world")

    #the second value "world" will be revealed when the first one is vacant.

    #pass input value X into html file, name means the placeholder in that file
    return render_template("index.html", name=X)