var button = document.getElementsByTagName('button')[0];

button.addEventListener("click", function(){console.log("click!!!")});



/* ADD NEW LIST WHEN CLICKING */
var enter = document.getElementById("enter");
var input = document.getElementById("userinput");
var ul = document.querySelector("ul");

function inputlength() {
	return input.value.length;
}

function createListElement() {
	var li = document.createElement("li");
	li.appendChild(document.createTextNode(input.value));
	ul.appendChild(li);
	input.value = "";
}

function addListAfterClick() {
	if (inputlength() > 0) {
		createListElement();
	}
}

function addListAfterKeypress(event) {
	if (inputlength() > 0 && event.keyCode === 13) {
		createListElement();
	}
}

enter.addEventListener("click", addListAfterClick);   //NOTICE: call funtion without "()""
input.addEventListener("keypress", addListAfterKeypress);


input.addEventListener("presskey", function(event) {
	if (inputlength() > 0 && event.keyCode > 13) {
		createListElement();
	}
})
