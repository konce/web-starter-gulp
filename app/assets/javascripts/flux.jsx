"use strict";

import React from "react"
import Router from "react-router"
import Fluxxor from "fluxxor"
import actions from "./flux/actions"
import routes from "./flux/routes"
import stores from "./flux/stores"

var router = Router.create({ routes: routes }),
    flux = new Fluxxor.Flux(stores, actions);

flux.on("dispatch", (type, payload) => {
    console.log("Dispatch:", type, payload)}
);

Router.run(routes, Router.HistoryLocation, (Handler) => {
  React.render(<Handler flux={flux} />, document.getElementById("application"));
});

