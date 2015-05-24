"use strict";

import React from "react"
import Router from "react-router"
var Link = Router.Link;

export default class Home extends React.Component {
  constructor(...args) {
    super(...args);
  }

  render() {
    return <div>
      <Link to="/posts/">Posts</Link>
    </div>
  }
}
