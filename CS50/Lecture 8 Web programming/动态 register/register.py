from flask import Flask, render_template, request

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")

# 不明白这里的POST，以及/register是否对应html中的/register？
@app.route("/register", methods=["POST"])
def register():
    # 为何这里一定要用 name 才能显示success？为啥不能用X代替？
    X = request.form.get("name")
    dorm = request.form.get("dorm")
    if not X or not dorm:
        return "failure"
    return render_template("success.html")

# flask puts get arguments in args, and put post arguments in form.