###*
Copyright (c) 2014, Facebook, Inc.
All rights reserved.

This source code is licensed under the BSD-style license found in the
LICENSE file in the root directory of this source tree. An additional grant
of patent rights can be found in the PATENTS file in the same directory.
###
React = require("react")
ReactPropTypes = React.PropTypes
TodoActions = require("../actions/TodoActions")
Footer = React.createClass(
  propTypes:
    allTodos: ReactPropTypes.object.isRequired


  ###*
  @return {object}
  ###
  render: ->
    allTodos = @props.allTodos
    total = Object.keys(allTodos).length
    return null  if total is 0
    completed = 0
    for key of allTodos
      completed++  if allTodos[key].complete
    itemsLeft = total - completed
    itemsLeftPhrase = (if itemsLeft is 1 then " item " else " items ")
    itemsLeftPhrase += "left"

    if (completed)
      clearCompletedButton =
        <button id="clear-completed" onClick={this._onClearCompletedClick}> Clear completed ({completed})</button>

    return (
      <footer id="footer">
        <span id="todo-count">
          <strong>
            {itemsLeft}
          </strong>
          {itemsLeftPhrase}
        </span>
        {clearCompletedButton}
      </footer>
    );


  ###*
  Event handler to delete all completed TODOs
  ###
  _onClearCompletedClick: ->
    TodoActions.destroyCompleted()

)
module.exports = Footer
