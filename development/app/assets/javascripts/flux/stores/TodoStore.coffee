#
# * Copyright (c) 2014, Facebook, Inc.
# * All rights reserved.
# *
# * This source code is licensed under the BSD-style license found in the
# * LICENSE file in the root directory of this source tree. An additional grant
# * of patent rights can be found in the PATENTS file in the same directory.
# *
# * TodoStore
#

###*
Create a TODO item.
@param  {string} text The content of the TODO
###
create = (text) ->

  # Hand waving here -- not showing how this interacts with XHR or persistent
  # server-side storage.
  # Using the current timestamp + random number in place of a real id.
  id = (+new Date() + Math.floor(Math.random() * 999999)).toString(36)
  _todos[id] =
    id: id
    complete: false
    text: text



###*
Update a TODO item.
@param  {string} id
@param {object} updates An object literal containing only the data to be
updated.
###
update = (id, updates) ->
  _todos[id] = assign({}, _todos[id], updates)


###*
Update all of the TODO items with the same object.
the data to be updated.  Used to mark all TODOs as completed.
@param  {object} updates An object literal containing only the data to be
updated.
###
updateAll = (updates) ->
  for id of _todos
    update id, updates


###*
Delete a TODO item.
@param  {string} id
###
destroy = (id) ->
  delete _todos[id]


###*
Delete all the completed TODO items.
###
destroyCompleted = ->
  for id of _todos
    destroy id  if _todos[id].complete

AppDispatcher = require("../dispatcher/AppDispatcher")
EventEmitter = require("events").EventEmitter
TodoConstants = require("../constants/TodoConstants")
assign = require("object-assign")
CHANGE_EVENT = "change"
_todos = {}
TodoStore = assign({}, EventEmitter::,

  ###*
  Tests whether all the remaining TODO items are marked as completed.
  @return {boolean}
  ###
  areAllComplete: ->
    for id of _todos
      return false  unless _todos[id].complete
    true


  ###*
  Get the entire collection of TODOs.
  @return {object}
  ###
  getAll: ->
    _todos


  emitChange: ->
    @emit CHANGE_EVENT


  ###*
  @param {function} callback
  ###
  addChangeListener: (callback) ->
    @on CHANGE_EVENT, callback


  ###*
  @param {function} callback
  ###
  removeChangeListener: (callback) ->
    @removeListener CHANGE_EVENT, callback
)

# Register to handle all updates
AppDispatcher.register (payload) ->
  action = payload.action
  switch action.actionType
    when TodoConstants.TODO_CREATE
      text = action.text.trim()
      create text  if text isnt ""
    when TodoConstants.TODO_TOGGLE_COMPLETE_ALL
      if TodoStore.areAllComplete()
        updateAll complete: false
      else
        updateAll complete: true
    when TodoConstants.TODO_UNDO_COMPLETE
      update action.id,
        complete: false

    when TodoConstants.TODO_COMPLETE
      update action.id,
        complete: true

    when TodoConstants.TODO_UPDATE_TEXT
      text = action.text.trim()
      if text isnt ""
        update action.id,
          text: text

    when TodoConstants.TODO_DESTROY
      destroy action.id
    when TodoConstants.TODO_DESTROY_COMPLETED
      destroyCompleted()
    else
      return true

  # This often goes in each case that should trigger a UI change. This store
  # needs to trigger a UI change after every view action, so we can make the
  # code less repetitive by putting it here.  We need the default case,
  # however, to make sure this only gets called after one of the cases above.
  TodoStore.emitChange()
  true # No errors.  Needed by promise in Dispatcher.

module.exports = TodoStore
