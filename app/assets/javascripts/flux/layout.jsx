"use strict";

import React from "react"
import Router from "react-router"

var Route = Router.Route,
    RouteHandler = Router.RouteHandler;

export default class Layout extends React.Component {
  constructor(...args) {
    super(...args);
  }

  render() {
    return <RouteHandler {...this.props} />
  }
}
