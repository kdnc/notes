## React Architecture

#### Q - What is React?
- React is a front-end JavaScript library developed by Facebook in 2011.
- It follows the component based approach which helps in building reusable UI components.
- It is used for developing complex and interactive web and mobile UI.
- Even though it was open-sourced only in 2015, it has one of the largest communities supporting it.
#### Q - What are the features of React?
- It uses the virtual DOM instead of the real DOM.
- It uses server-side rendering.
- It follows uni-directional data flow or data binding.
#### Q - What are the advantages of using React?
- It increases the application’s performance
- It can be conveniently used on the client as well as server side.  This enables improved SEO and performance.
- Because of JSX, code’s readability increases. It is also really easy to see the layout, or how components are plugged/combined with each other.
- React is easy to integrate with other frameworks like Meteor, Angular, etc as it is only a view layer.
- Using React, writing UI test cases become extremely easy
#### Q - What are the limitations of React?
- React is just a library, not a full-blown framework
- Its library is very large and takes time to understand
- Coding gets complex as it uses inline templating and JSX
#### Q - How does React work?
React creates a virtual DOM. When state changes in a component it firstly runs a "diffing" algorithm, which identifies what has changed in the virtual DOM. The second step is reconciliation, where it updates the DOM with the results of diff.
#### Q - What do you understand by Virtual DOM? Explain its working.
- A virtual DOM is a lightweight JavaScript object which originally is just the copy of the real DOM. It is a node tree that lists the elements, their attributes and content as Objects and their properties.
- React’s render function creates a node tree out of the React components. It then updates this tree in response to the mutations in the data model which is caused by various actions done by the user or by the system.
- This Virtual DOM works in three simple steps.
    1. Whenever any underlying data changes, the entire UI is re-rendered in Virtual DOM representation.

        ![](https://d1jnx9ba8s6j9r.cloudfront.net/blog/wp-content/uploads/2017/08/1dom-492x180.png)

    2. Then it runs a "diffing" algorithm, which identifies the difference between the previous DOM representation and the new one.

        ![](https://d1jnx9ba8s6j9r.cloudfront.net/blog/wp-content/uploads/2017/08/2dom-430x180.png)
    3. Next step is reconciliation which is that the real DOM will be updated with only the things that have actually changed.

        ![](https://d1jnx9ba8s6j9r.cloudfront.net/blog/wp-content/uploads/2017/08/3dom-209x180.png)


#### Q - Differentiate between Real DOM and Virtual DOM.
Real DOM
- It updates slow.
- Can directly update HTML.
- Creates a new DOM if element updates.
- DOM manipulation is very expensive.
- Too much of memory wastage.

Virtual DOM
- It updates faster.
- Can’t directly update HTML.
- Updates the JSX if element updates.
- DOM manipulation is very easy.
- No memory wastage.

Create-react-app

#### Q - Why would you eject from create-react-app?
Until you eject you are unable to configure webpack or babel presets.

## Components

#### Q - What is the difference between a Presentational component and a Container component?
Presentational components are concerned with how things look. They generally receive data and callbacks exclusively via props. These components rarely have their own state, but when they do it generally concerns UI state, as opposed to data state.
Container components are more concerned with how things work. These components provide the data and behavior to presentational or other container components. They call Flux actions and provide these as callbacks to the presentational components. They are also often stateful as they serve as data sources.
#### Q - What are the differences between a class component and functional component?
Class components allows you to use additional features such as local state and lifecycle hooks. Also, to enable your component to have direct access to your store and thus holds state.
When your component just receives props and renders them to the page, this is a 'stateless component', for which a pure function can be used. These are also called dumb components or presentational components.
#### Q - What are controlled components?
In HTML, form elements such as input html element, textarea html element, and select html element typically maintain their own state and update it based on user input. When a user submits a form the values from the aforementioned elements are sent with the form. With React it works differently. The component containing the form will keep track of the value of the input in its state and will re-render the component each time the callback function e.g. onChange is fired as the state will be updated. An input form element whose value is controlled by React in this way is called a "controlled component".
#### Q - What is a higher order component?
A higher-order component is a function that takes a component and returns a new component. HOC's allow you to reuse code, logic and bootstrap abstraction. The most common is probably Redux’s connect function. Beyond simply sharing utility libraries and simple composition, HOCs are the best way to share behavior between React Components. If you find yourself writing a lot of code in different places that does the same thing, you may be able to refactor that code into a reusable HOC.



## State

#### Q - What is state in react?
State is similar to props, but it is private and fully controlled by the component. State is essentially an object that holds data and determines how the component renders and behaves.
#### Q - What is the difference between state and props?
The state is a data structure that starts with a default value when a Component mounts. It may be mutated across time, mostly as a result of user events.
Props (short for properties) are a Component's configuration. They are received from above and immutable as far as the Component receiving them is concerned. A Component cannot change its props, but it is responsible for putting together the props of its child Components. Props do not have to just be data - callback functions may be passed in as props.
#### Q - Why is it advised to pass a callback function to setState as opposed to an object?
Because this.props and this.state may be updated asynchronously, you should not rely on their values for calculating the next state.

## Lifecycle

#### Q - Name the different lifecycle methods.
`componentWillMount` lifecycle method - this is most commonly used for App configuration in your root component.
`componentDidMount` lifecycle method - here you want to do all the setup you couldn’t do without a DOM, and start getting all the data you need. Also if you want to set up event listeners etc. this lifecycle hook is a good place to do that.
`componentWillReceiveProps` lifecycle method - this lifecycle acts on particular prop changes to trigger state transitions.
`shouldComponentUpdate` lifecycle method - if you’re worried about wasted renders  shouldComponentUpdate is a great place to improve performance as it allows you to prevent a rerender if component receives new prop. shouldComponentUpdate should always return a boolean  and based on what this is will determine if the component is re rendered or not.
`componentWillUpdate` lifecycle method - rarely used. It can be used instead of componentWillReceiveProps on a component that also has shouldComponentUpdate (but no access to previous props).
`componentDidUpdate` lifecycle method - also commonly used to update the DOM in response to prop or state changes.
`componentWillUnmount` lifecycle method - here you can cancel any outgoing network requests, or remove all event listeners associated with the component.
#### Q - Where in a React component should you make an AJAX request?
componentDidMount is where an AJAX request should be made in a React component. This method will be executed when the component “mounts” (is added to the DOM) for the first time. This method is only executed once during the component’s life. Importantly, you can’t guarantee the AJAX request will have resolved before the component mounts. If it doesn't, that would mean that you’d be trying to setState on an unmounted component, which would not work. Making your AJAX request in componentDidMount will guarantee that there’s a component to update.

## Rendering Elements

#### Q - What is Children?
In JSX expressions that contain both an opening tag and a closing tag, the content between those tags is passed to components automatically as a special prop called props.children.
There are a number of methods available in the React API to work with this children prop. These include `React.Children.map`, `React.Children.forEach`, `React.Children.count`, `React.Children.only`, `React.Children.toArray`

## JSX

#### Q - What is JSX?
- JSX is a shorthand for JavaScript XML.
- This is a type of file used by React which utilizes the expressiveness of JavaScript along with HTML like template syntax. This makes the HTML file really easy to understand. 
- You can embed any JavaScript expression in JSX by wrapping it in curly braces.
- JSX produces React "elements". After compilation, JSX expressions become regular JavaScript objects.
- You can use JSX inside of if statements and for loops, assign it to variables, accept it as arguments, and return it from functions.
    ```javascript
    render(){
        return(        
            <div>
                <h1> Hello World from Edureka!!</h1>
            </div>
        );
    }
    ```

## Ref

#### Q - What are refs used for in React?
Refs are used to get reference to a DOM node or an instance of a component in React. Good examples of when to use refs are for managing focus/text selection, triggering imperative animations, or integrating with third-party DOM libraries. You should avoid using string refs and inline ref callbacks. Callback refs are advised by React.

## Redux

#### Q - What is redux?
The basic idea of redux is that the entire application state is kept in a single store. The store is simply a javascript object. The only way to change the state is by firing actions from your application and then writing reducers for these actions that modify the state. The entire state transition is kept inside reducers and should not have any side-effects.
#### Q - What is a store in redux?
The store is a javascript object that holds application state. Along with this it also has the following responsibilities:
Allows access to state via `getState()`
Allows state to be updated via `dispatch(action)`
Registers listeners via `subscribe(listener)`
Handles unregistering of listeners via the function returned by subscribe(listener).
#### Q - What is an action?
Actions are plain javascript objects. They must have a type indicating the type of action being performed. In essence, actions are payloads of information that send data from your application to your store.
#### Q - What is a reducer?
A reducer is simply a pure function that takes the previous state and an action, and returns the next state.

## Redux Thunk

#### Q - What is Redux Thunk used for?
Redux thunk is middleware that allows you to write action creators that return a function instead of an action. The thunk can then be used to delay the dispatch of an action if a certain condition is met. This allows you to handle the asynchronous dispatching of actions.


## Performance

#### Q - When rendering a list what is a key and what is its purpose?
Keys help React identify which items have changed, are added, or are removed. Keys should be given to the elements inside the array to give the elements a stable identity. The best way to pick a key is to use a string that uniquely identifies a list item among its siblings. Most often you would use IDs from your data as keys. When you don't have stable IDs for rendered items, you may use the item index as a key as a last resort. It is not recommend to use indexes for keys if the items can reorder, as that would be slow.
