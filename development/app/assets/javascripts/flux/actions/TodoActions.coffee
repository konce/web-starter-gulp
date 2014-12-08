#
# * Copyright (c) 2014, Facebook, Inc.
# * All rights reserved.
# *
# * This source code is licensed under the BSD-style license found in the
# * LICENSE file in the root directory of this source tree. An additional grant
# * of patent rights can be found in the PATENTS file in the same directory.
# *
# * TodoActions
#
AppDispatcher = require("../dispatcher/AppDispatcher")
TodoConstants = require("../constants/TodoConstants")
TodoActions =

  ###*
  @param  {string} text
  ###
  create: (text) ->
    AppDispatcher.handleViewAction
      actionType: TodoConstants.TODO_CREATE
      text: text

    return


  ###*
  @param  {string} id The ID of the ToDo item
  @param  {string} text
  ###
  updateText: (id, text) ->
    AppDispatcher.handleViewAction
      actionType: TodoConstants.TODO_UPDATE_TEXT
      id: id
      text: text

    return


  ###*
  Toggle whether a single ToDo is complete
  @param  {object} todo
  ###
  toggleComplete: (todo) ->
    id = todo.id
    if todo.complete
      AppDispatcher.handleViewAction
        actionType: TodoConstants.TODO_UNDO_COMPLETE
        id: id

    else
      AppDispatcher.handleViewAction
        actionType: TodoConstants.TODO_COMPLETE
        id: id

    return


  ###*
  Mark all ToDos as complete
  ###
  toggleCompleteAll: ->
    AppDispatcher.handleViewAction actionType: TodoConstants.TODO_TOGGLE_COMPLETE_ALL
    return


  ###*
  @param  {string} id
  ###
  destroy: (id) ->
    AppDispatcher.handleViewAction
      actionType: TodoConstants.TODO_DESTROY
      id: id

    return


  ###*
  Delete all the completed ToDos
  ###
  destroyCompleted: ->
    AppDispatcher.handleViewAction actionType: TodoConstants.TODO_DESTROY_COMPLETED
    return

module.exports = TodoActions
