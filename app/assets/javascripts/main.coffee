"use strict"

Device = require "./javascript/components/device"
device = new Device()

JavascriptApp = require "./javascript/app"
JavascriptApp.start
  device: device.options

FluxApp = require "./flux/app"

MarionetteApp = require "./marionette/app"
MarionetteApp.start
  device: device.options
