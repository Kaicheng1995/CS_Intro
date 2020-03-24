#1: fixed line
from flask import Flask, render_template, request

#2: turn this file into a web applicaton
app = Flask(__name__)

#3: built a route that's listening for "/", and go ahead do something
@app.route("/")
def index():
    return "hello, world"
