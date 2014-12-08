###*
Copyright (c) 2014, Facebook, Inc.
All rights reserved.

This source code is licensed under the BSD-style license found in the
LICENSE file in the root directory of this source tree. An additional grant
of patent rights can be found in the PATENTS file in the same directory.
###
React = require("react")
ReactPropTypes = React.PropTypes
ENTER_KEY_CODE = 13
TodoTextInput = React.createClass(
  propTypes:
    className: ReactPropTypes.string
    id: ReactPropTypes.string
    placeholder: ReactPropTypes.string
    onSave: ReactPropTypes.func.isRequired
    value: ReactPropTypes.string

  getInitialState: ->
    value: @props.value or ""


  ###*
  @return {object}
  ###
  render: -> #object
    return (
      <input
            className={this.props.className}
            id={this.props.id}
            placeholder={this.props.placeholder}
            onBlur={this._save}
            onChange={this._onChange}
            onKeyDown={this._onKeyDown}
            value={this.state.value}
            autoFocus={true}
          />
    )

  ###*
  Invokes the callback passed in as onSave, allowing this component to be
  used in different ways.
  ###
  _save: ->
    @props.onSave @state.value
    @setState value: ""
    return


  ###*
  @param {object} event
  ###
  _onChange: (event) -> #object
    @setState value: event.target.value
    return


  ###*
  @param  {object} event
  ###
  _onKeyDown: (event) ->
    @_save()  if event.keyCode is ENTER_KEY_CODE
    return
)
module.exports = TodoTextInput
