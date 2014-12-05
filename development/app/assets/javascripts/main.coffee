"use strict"

Device = require "./components/device/device"
device = new Device()


JavascriptApp = require "./javascript/app"
#JavascriptApp.start()

MarionetteApp = require "./marionette/app"
MarionetteApp.start
  device: device.options
console.log "Marionette App started:"
console.log MarionetteApp
