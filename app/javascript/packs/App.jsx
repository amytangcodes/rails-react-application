import React, { Component } from "react";
import ReactDOM from "react-dom";

class App extends Component {
  render() {
    return <div>React App is showing!</div>;
  }
}

document.addEventListener("turbolinks:load", () => {
  const app = document.getElementById("app");
  app && ReactDOM.render(<App />, app);
});
