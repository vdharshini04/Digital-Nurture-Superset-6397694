import React, { Component } from 'react';

class CurrencyConvertor extends Component {
  constructor(props) {
    super(props);
    this.state = {
      rupees: '',
      euro: ''
    };
  }

  handleChange = (e) => {
    this.setState({ rupees: e.target.value });
  };

  handleSubmit = (e) => {
    e.preventDefault();
    const rupees = parseFloat(this.state.rupees);
    const euroValue = (rupees / 90).toFixed(2); // Assuming 1 Euro = ₹90
    this.setState({ euro: euroValue });
  };

  render() {
    return (
      <div>
        <h2>Currency Convertor (INR → EUR)</h2>
        <form onSubmit={this.handleSubmit}>
          <label>Enter Amount in ₹:</label>
          <input
            type="number"
            value={this.state.rupees}
            onChange={this.handleChange}
          />
          <button type="submit">Convert</button>
        </form>

        {this.state.euro && (
          <p>
            Equivalent in Euro: <strong>€{this.state.euro}</strong>
          </p>
        )}
      </div>
    );
  }
}

export default CurrencyConvertor;
