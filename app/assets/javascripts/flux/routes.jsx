"use strict";

import React from "react/addons"
import Router from "react-router"
import Layout from "./layout"
import Home from "./home/home"
import Posts from "./posts/posts"

var Route = Router.Route,
    Location = Router.Route,
    DefaultRoute = Router.DefaultRoute,
    CSSTransitionGroup = React.addons.CSSTransitionGroup;

export default Route =
  <Route handler={Layout} name="home" path="/">
    <Route handler={Posts} name="posts" path="/posts/" />
    <DefaultRoute handler={Home} />
  </Route>;
