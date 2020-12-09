from flask import Flask, render_template, request

app = Flask(__name__)

WORDS = []
with open("large","r") as file:
    for line in file.readlines():   #read every line
        WORDS.append(line.rstrip())   #remove whitespace from the end of the string
                                       #store all words in WORD list


@app.route("/")
def index():
    return render_template("index.html")

@app.route("/search")
def search():
    words = [word for word in WORDS if word.startswith(request.args.get("q"))]
    return render_template("search.html", words=words)

# statswith means the starting letter, "q" means user input
# words is a list