
#TweenLite = require "TweenLite"
#TimelineLite = require "TimelineLite"
#TweenMax = require "TweenMax"
#TimelineMax = require "TimelineMax"
#TimelineMax = require "TimelineMax"
#Modernizr = require "modernizr"
#Platform = require "platform"
#Device = require "device"


#RadComponent = require "./react-component"

#React.renderComponent(
#  RadComponent
#    rad: "Hello world! I am React with coffee :)"
#  document.getElementById('container')
#)

Base = require "./components/base"
base = new Base()

MarionetteApp = require "./marionette/app"
MarionetteApp.start()
console.log "Marionette App: ", MarionetteApp
