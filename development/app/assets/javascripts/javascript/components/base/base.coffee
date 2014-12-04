"use strict"

$ = require "jquery"
Device = require "device"
Modernizr = require "modernizr"

# Base class for project.
class Base


  defaults:
    $window: $(window)
    $document: $(document)
    $html: $('html')
    $body: $('body')


  constructor: (options) ->
    @setOptions(options)
    @detectMouseOrTouchHandler()


  setOptions: (options) ->
    @options = merge {}, @defaults, options
    this


  on: (event, handler) ->
    @_events ?= {}
    (@_events[event] ?= []).push handler
    this


  off: (event, handler) ->
    for suspect, index in @_events[event] when suspect is handler
      @_events[event].splice index, 1
    this


  trigger: (event, args...) ->
    return this unless @_events[event]?
    handler.apply this, args for handler in @_events[event]
    this


  @include = (objects...) ->
    merge @prototype, objects...
    this


  merge =  (target, extensions...) ->
    for extension in extensions
      for own property of extension
        target[property] = extension[property]
    target


  # Detect touch or mouse click, resize or orientationchange.
  #
  # @example detectMouseOrTouchHandler
  #   new Base().detectMouseOrTouchHandler()
  #
  detectMouseOrTouchHandler: ->
    @options.eventClick = if Device.mobile() or Device.tablet() then "touchstart" else "click"
    @options.eventResize = if Device.mobile() or Device.tablet() then "orientationchange" else "resize"


module.exports = Base
