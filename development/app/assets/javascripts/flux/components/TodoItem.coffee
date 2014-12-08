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
TodoTextInput = require("./TodoTextInput")
cx = require("react/lib/cx")
TodoItem = React.createClass(
  propTypes:
    todo: ReactPropTypes.object.isRequired

  getInitialState: ->
    isEditing: false


  ###*
  @return {object}
  ###
  render: ->
    todo = @props.todo
    if (this.state.isEditing)
      input =
        <TodoTextInput
          className="edit"
          onSave={this._onSave}
          value={todo.text}
        />;

    return (
      <li
        className={cx({
          'completed': todo.complete,
          'editing': this.state.isEditing
        })}
        key={todo.id}>
        <div className="view">
          <input
            className="toggle"
            type="checkbox"
            checked={todo.complete}
            onChange={this._onToggleComplete}
          />
          <label onDoubleClick={this._onDoubleClick}>
            {todo.text}
          </label>
          <button className="destroy" onClick={this._onDestroyClick} />
        </div>
        {input}
      </li>
    )


  # List items should get the class 'editing' when editing
  # and 'completed' when marked as completed.
  # Note that 'completed' is a classification while 'complete' is a state.
  # This differentiation between classification and state becomes important
  # in the naming of view actions toggleComplete() vs. destroyCompleted().
  _onToggleComplete: ->
    TodoActions.toggleComplete @props.todo
    return

  _onDoubleClick: ->
    @setState isEditing: true
    return


  ###*
  Event handler called within TodoTextInput.
  Defining this here allows TodoTextInput to be used in multiple places
  in different ways.
  @param  {string} text
  ###
  _onSave: (text) ->
    TodoActions.updateText @props.todo.id, text
    @setState isEditing: false
    return

  _onDestroyClick: ->
    TodoActions.destroy @props.todo.id
    return
)
module.exports = TodoItem
