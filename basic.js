RESOURCES
-----------------
1. JS CHAR CODES: https://www.cambiaresearch.com/articles/15/javascript-char-codes-key-codes
2. DOM: https://www.w3schools.com/js/js_htmldom.asp










JAVASCRIPT TYPES
-----------------
/*
1. Number: 123456
2. String: "hello!" + "This isn\'t very nice"
3. Boolean: true false
4. Undefined
5. Null
6. Symbol (new in ECMAScript 6)
7. Object
*/

JAVASCRIPT VARIABLES
-----------------
/*
1. var: Can hold everthing, and it should start with a letter
2. let (new in ECMAScript 6)
3. const (new in ECMAScript 6)
*/

JAVASCRIPT FUNCTIONS
-----------------
/*
1. function name() {} : Creating a function called "name"
2. var a = function name() {} : Assigning a function to a variable, and the variable alse can be invoked
3. built-in functions: promt(); alert(); console.log(); */
*******************
NOTICE: FUNCTIONS CAN BE VARIABLES IN JS!!!
*******************
function sayhello(){
  console.log("hello");
}
var x = function(){
  console.log("hello");
}

  
JAVASCRIPT DATA STRUCTURES
-----------------
/*
1. Array
2. Object */
*******************
var animal = ["tiger", "cat", "bear", "bird"];
console.log(animal[0]);
var digits = [0, 1, 2, 3];
var judge = [true, false, true, true];
var mixed = ["tiger", funtion sayhello(){..}, 100, undefined, true];  //NOTICE: We can actually put EVERYTHING in arrays.
var nested = [[1,2,3],[4,5,6],[7,8,9],[10,11,12]]  //NOTICE: We have arrays in arrays.
console.log(nested[0][0]); // JS Array Method (GOOGLE)
*******************
var object = {
	name: "John",
	age: 34,
	hobby: "Soccer",
	isMarried: false,
	spells: ["asd", "sfd", "dfgf"]
	shout: function(){
		console.log("AHHHHH!");
	}
};
object.spells[0];
object.shout();
*******************
var array = [
	{
		username: "andy",
		password: 123
	},
	{
		username: "jess",
		password: 456
	}
];
array[0].username;
/* NOTICE:
1. Object is a colletion of all kinds of properties, including FUNCTIONS.
2. Object and Array and exist in each other's content.
3. The way to access their content follows original rules.(very simple) */

  
JAVASCRIPT LOOPING
-----------------
/*
1. for
2. while
3. do while
4. forEach (new in ECMAScript 5)
*/
var todos = [
	"clean room",
	"brush teeth",
	"exercise",
	"study javascript",
	"eat healthy"
]
*******************
for(var i=0; i<todos.length; i++){
	console.log(todos.[i], i);
}
*******************
todos.forEach(function(x, y)
{
	console.log(x, y);
})
*******************
function logTodo(x, y){
	console.log(x, y);
}
todo.forEach(logTodo);
/* NOTICE: Above three have exact upshots.*/
  
  
JAVASCRIPT COMPARISONS
-----------------
/*
1. !== : not equal
2. === : equal
3. >= 
4. <=
5. >
6. <
*/


JAVASCRIPT CONDITIONALS
-----------------
/*
1. if
2. else
3. else if
4. ternary operator : condition? expression 1 : expression 2
5. switch (when a lot of conditions)
*/

var answer = true/false ? expr 1 : expr 2

function move(direction) {
	var happen;
	switch (direction) {
		case "forward":
			happen = "1";
			break;
		case "back":
			happen = "2";
		default:
			happen = "none";
	}
	return happen;
}


  
JAVASCRIPT LOGICAL OPERATORS
-----------------
/*
1. &&
2. ||
3. !
*/


JAVASCRIPT KEYWORDS
-----------------
break
case
catch
class
const
continue
debugger
default
delete
do
else
export
extends
finally
for
function
if
import
in
instanceof
new
return
super
switch
this
throw
try
typeof
var
void
while
with
yield





DOM -(DOCUMENT OBJECT MODEL)
-----------------
// not common use (return array except ID)
document.getElementsByTagName()
document.getElementsByClassname()
doucument.getElementById()

// common use (return array)
document.querySelector()   //return the first of the array
document.querySelectorAll()

document.querySelector.getAttribute()
document.querySelector.setAttribute()

// changing styles
style.{property}  - //this could be not handy

document.querySelector().className
document.querySelector().classList   //best
classList.add
classList.remove
classList.toggle

// other dangerous syntax
innerHTML
parentElement
children






CASE 1 
-----------------
// when do an action, it triggers a function
addEventListener("action", function(){})   // action can be "presskey", "click"

// initialize a new tag, assign value to the list
createElement("element")
appendChild
createTextNode


CASE 2
-----------------
background: linear-gradient(to right, red , yellow);  //CSS syntax

input type="color": color generator //html syntax

textContent // JS syntax




JQuery is imperitive and outdated 
-----------------

	
SCOPE
-----------------
scope : like local and global 





ECMASCRIPT 6
-----------------
let //符合scope原则，用var会有些混乱，就用let就好了.
						//详见闭包解释：https://www.w3school.com.cn/js/js_function_closures.asp
const //cannot be updated, but can change properties in objects

const object = {
	player: "bobby",
	experience: 100,
	level: false
}

//same as: const player = object.player;
const { player, experience } = object;
let { level } = object;

//same as a:a, b:b, c:c
const a = "simon";
const b = 10;
const c = {};
const object = {
	a,
	b,
	c
}

//access variable
const name = "Sally";
` ${name} `

//arrow function
function add(a, b) {
	return a + b;
}
const add = (a, b) => a + b;



ES7: ( includes )
-----------------
'hello'.includes('o'); //true, also apply to objects



ES8: 
-----------------
1. string padding
"hello".padStart(10); //add 10 indents from the start
"hello".padEnd(10);

2. 括号里多个input最后有逗号也没关系（方便copy）

3. Object Iteration

Object.keys(obj).forEach((key, index) => {})

Object.values(obj).forEach(value => {}) //only value (value is an ARRAY)

Object.entries(obj).forEach(value => {}) //all content

Object.entries(obj).map(value => {}) 


ES10:
-----------------
1. flat()
const array = [1,[2, 3, [5]]
array.flat(input); //remove nested array for input layers

2. flatMap()
// flat one layer and do iterative function
const arrayChaos = array.flatMap(number => number + 1)

3. trimStart(), trimEnd()
// delete blank spaces
const email = '      abbey@gmail.com     '

4. Object.fromEntries()
// turn array into object (与Entries恰好相反)
array = [['name', 'H'], ['age', 10]];
Object.fromEntries(array);

5. try {
	//something
} catch {
	//if cannot try, do something
}






ADVANCED FUNCTION
-----------------
1. CLOSURE ： 类似scope的意义，local，global

2. CURRYING: nested function
const multiply = (a, b) => a * b;
const multiply = (a) => (b) => a * b; 
const multiplyBy5 = multiply(5);
multiplyBy5(6) === 5 * 6;

3. COMPOSE:
const compose = (f, g) => (a) => f(g(a));
const sum = (sum) => sum + 1;
compose(sum, sum)(5) === 7;

//avoid side effect and keep functional purity



ADVANCED ARRAY
-----------------
const array = [1, 2, 3, 4];
const double = [];

const newarray = array.forEach(num => {
	double.push(num * 2);
});

//map : must return value (当input只有一个，function只有一个return内容时，可以省略大括号)
const maparray = array.map(num => num * 2);

//filter
const filterarray = array.filter(num => num > 5);

//reduce
https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce




ADVANCED OBJECT
-----------------
//1. Reference type vs primitive type
OBJECT is a reference type (address)

//2. Context
this

//3. Instantiation
class Player {
	constructor(name, type) {
		this.name = name;
		this.type = type;
	}
	introduce() {
		console.log(`I am ${this.name}, and ${this.type}`);
	}
}

class Wizard extends Player { //extends copies content from Player
	constructor(name, type) {
		super(name type) //fixed syntax to copy constructor
	}
	play() {
		console.log(`I am ${this.type}`)
	}
}

const Wizard1 = new Wizard("Shellly", "Healer");
Wizard1.introduce();




TYPE COERCION
-----------------
//equality comparisons and sample
convert date type when using "==" compare



ADVANCED LOOPING
-----------------
const basket = ['apple', 'orange'];
const detailedBasket = { //Obeject is not iterable
	apple: 5,
	orange: 10,
}


// for of
// iterating - arrays, strings
for (item of basket) {
	console.log(item);
}

// for in - properties
// enumerating - objects
for (item in detailedBasket) {
	console.log(item); 
}




How JS works
-----------------
debugger
memory heap, call stack, stack overflow
synchronous, asynchronous

setTimeout(
	() => {console.log('2')},
	2000
)


		// call stack
setTimeout()	// web api
		// callback queue
check empty	// event LOOPING

JS is a single threaded language that can be nonblocking





MODULES
-----------------

	
NPM
-----------------
HTML ,CSS, JS
GIT, GITHUB
package.json
live-server
lodash

//check lasted version of dependencies
https://semver.npmjs.com/

//logo maker
https://hatchful.shopify.com/

//relationship explain
https://blog.csdn.net/xingmeiok/article/details/90299089





HTTP
-----------------
request: (use http)
webbrowser(client) => sever

response: (use http)
sever => webbrowser
1/ http messages : 200 OK, 404 NOT FOUND..
2/ DATA


HTTP: get - post - put - delete






JSON
-----------------
JSON： JavaScript Object Notation
It's a syntax for storing and exchanging data
XML is another way but JSON is better

JSON.parse (change JSON back to JS)
JSON.stringify (change JS to JSON)




AJAX
-----------------





JS PROMISE + Async Await
-----------------
https://www.jianshu.com/p/b16e7c9e1f9f
