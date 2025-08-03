import './App.css';

import React, { Component } from 'react';
import CurrencyConvertor from './CurrencyConvertor';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      count: 0
    };
  }

  // Event: Increment counter and say hello
  handleIncrement = () => {
    this.increment();
    this.sayHello();
  };

  increment = () => {
    this.setState({ count: this.state.count + 1 });
  };

  sayHello = () => {
    alert('Hello! Counter was incremented.');
  };

  // Event: Decrement counter
  handleDecrement = () => {
    this.setState({ count: this.state.count - 1 });
  };

  // Event: Pass argument
  sayWelcome = (message) => {
    alert(message);
  };

  // Synthetic event handler
  handleSyntheticEvent = (e) => {
    e.preventDefault(); // synthetic event
    alert('I was clicked');
  };

  render() {
    return (
      <div style={{ padding: '20px' }}>
        <h2>React Event Handling</h2>
        <h3>Counter: {this.state.count}</h3>

        <button onClick={this.handleIncrement}>Increment</button>
        &nbsp;
        <button onClick={this.handleDecrement}>Decrement</button>
        <br /><br />

        <button onClick={() => this.sayWelcome('Welcome to React Events!')}>
          Say Welcome
        </button>
        <br /><br />

        <button onClick={this.handleSyntheticEvent}>
          Click on me
        </button>
        <br /><br />

        <CurrencyConvertor />
      </div>
    );
  }
}

export default App;
