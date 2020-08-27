import React, { Component } from "react";
import Comp1 from "./comp1";
import Comp2 from "./comp2";

export default class App extends Component {
  constructor(props) {
    super(props);

    //  this.handleClick = this.handleClick.bind(this);
    // this.handleLogoffClick = this.handleLogoffClick.bind(this);
  }

  render() {
    return (
      <div>
        <Comp1></Comp1>
        <Comp2></Comp2>
      </div>
    );
  }
}
