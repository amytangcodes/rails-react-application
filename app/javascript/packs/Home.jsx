// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from "react";
import ReactDOM from "react-dom";

const Home = () => (
  <div className="container">
    <h1>Home Page</h1>
  </div>
);

document.addEventListener("DOMContentLoaded", () => {
  const home = document.getElementById("home-page");
  home && ReactDOM.render(<Home />, home);
});
