React = require "react"
Fluxxor = require "fluxxor"

actions = require "./actions"
stores = require "./stores"

flux = new Fluxxor.Flux(stores, actions)
