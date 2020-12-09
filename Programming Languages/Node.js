BASICS
---------------
运行: node, node + filename
调包: require('filepath')
	  module.exports = {OBJECT}




POPOLAR MODULES
---------------
fs : file system
http : for building server
nodemon




BUILDING A SERVER
---------------
const http = require('http');
const server = http.createServer((request, response) => {
	console.log(request.method);
	console.log(request.url);

	const user = {
		name: 'John',
		age: '22'
	}
	response.setHeader('Content-Type', 'application/json');
	response.end(JSON.stringify(user));
})

server.listen(3000);






EXPRESS
---------------
//调包,其实包都是一个object
const express = require('express');
const app = express();
// '/'指root url,类似flask里的句型
app.get('/', (req, res) => {
	res.send("hello");
});
app.listen(3000);







EXPRESS MIDDLEWARE
---------------
app.use((req, res, next) => {
	next();
})








POSTMAN
---------------
npm install body-parser
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

app.post('/profile', (req, res) => {
	console.log(req.body);
	res.send('success');
})












