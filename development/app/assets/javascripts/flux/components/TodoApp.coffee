
###*
Copyright (c) 2014, Facebook, Inc.
All rights reserved.

This source code is licensed under the BSD-style license found in the
LICENSE file in the root directory of this source tree. An additional grant
of patent rights can be found in the PATENTS file in the same directory.
###

###*
This component operates as a "Controller-View".  It listens for changes in
the TodoStore and passes the new data to its children.
###

###*
Retrieve the current TODO data from the TodoStore
###
getTodoState = ->
  allTodos: TodoStore.getAll()
  areAllComplete: TodoStore.areAllComplete()
Footer = require("./Footer")
Header = require("./Header")
MainSection = require("./MainSection")
React = require("react")

TodoStore = require("../stores/TodoStore")
TodoApp = React.createClass(
  getInitialState: ->
    getTodoState()

  componentDidMount: ->
    TodoStore.addChangeListener @_onChange

  componentWillUnmount: ->
    TodoStore.removeChangeListener @_onChange


  ###*
  @return {object}
  ###
  render: ->
    return (
      <div>
        <Header />
        <MainSection
            allTodos={this.state.allTodos}
            areAllComplete={this.state.areAllComplete}
          />
        <Footer allTodos={this.state.allTodos} />
      </div>
    );


  ###*
  Event handler for 'change' events coming from the TodoStore
  ###
  _onChange: ->
    @setState getTodoState()

)
module.exports = TodoApp
