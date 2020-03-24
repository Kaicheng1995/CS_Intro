Prerequisite
-----------------
npm install -g create-react-app
create-react-app robofriends
//or
npx create-react-app robofriends
npm start




REACT COMPONENT
-----------------
//Part1 : Component_Name.js
import React from 'react';
import './Component_Name.css'
class App extends React.Component {
  render() {
    return ();
  }
export default Component_Name;


//Part2 : Index.js
//所有的JS文件都在index.js中import并上线
import Hello from './Hello';
ReactDOM.render(<Component_Name />,document.getElementById('root'));



tachyons (CSS框架)
-----------------
npm install tachyons
Index.js中引入tachyons，Component_Name.js中添加 className='property',
注意之所以是className 不是 class，是为了和JS class区分开。




JSX
-----------------
可以理解为在JS中写HTML




COMPONENT
-----------------
// one component
API, PASS variable

// bigger component
index.js 里的内容都是解释input变量

// App component + component interaction
state的用法，和parent的沟通传递子component信息





ReactComponent lifecycle hooks:
-----------------
1/ Mounting: constructor() componentWillMount() render() componentDidMount()
2/ Updating
3/ Unmounting
JSONPlaceholder


PROPS, STATE, CHILDREN
-----------------

  
  
OTHER
-----------------
// project files
components, containers

// update library
npm update

// deploy react app
https://create-react-app.dev/docs/deployment/



REDUX
————————————————
1/ good for mangaging large state
2/ useful for sharing data between containers
3/ 3 principles
		3.1/ single source of truth
		3.2/ state is read only
		3.3/ changes using pure functions

Action - (middleware) - Reducer - Store - Make changes

Debug Tool(middleware): 
1/ redux-logger, show chronological list of actions
2/ redux devTools


Asynchronous : redux-thunk
