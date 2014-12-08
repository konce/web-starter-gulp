"use strict"

Base = require "./../../components/base/base"

class Menu extends Base

  # Get menu.
  _menu: -> @options.menu


  # Get btn object.
  _btn: -> @options.btn


  # Get active menu classname.
  _active: -> @options.active.substring(1)


  # Get btn object.
  _$btn: -> $(@_btn())


  # Get menu object.
  _$menu: -> $(@_menu())


  # Show menu.
  _show: ->


  # Hide menu.
  _hide: ->


  # Handler click on btns for show/hide menu
  _setHandlerClick: ->
    @options.$body.on @options.device.events.click, @_btn(), =>
      unless @_$menu().hasClass(@_active())
        @_$menu().addClass(@_active())
        console.log 'active'
      else
        console.log 'no-active'
        @_$menu().removeClass(@_active())


  # Start menu app.
  start: ->
    @_setHandlerClick()


module.exports = Menu
