"use strict"

$ = require "jquery"
device = require "device"
platform = require "platform"
#Modernizr = require "modernizr"

Base = require "./../base/base"

# Device class.
class Device extends Base


  defaults:
    device:
      type: ""
      vendor: ""
    events:
      click: ""
      resize: ""


  constructor: (options) ->
    @_setOptions(options)
    @device()
    @events()

    console.log @



  # Return device: phone / tablet / desktop
  device: ->
    @options.device.type = if device.mobile() then  "phone"
    else if device.tablet() then "tablet"
    else if device.desktop() then "desktop"
    @options.device.type


  vendor: ->
    @options.device.vendor
    @options.device.vendor


  # Return: touch / click, resize / orientationchange.
  events: ->
    @options.events =
      click: unless @options.device.type is "desktop" then "touchstart" else "click"
      resize: unless @options.device.type is "desktop" then "orientationchange" else "resize"
    @options.events



module.exports = Device
