"use strict"

Rem = require "./rem"
Base = require "./base"
Menu = require "./menu"
UI = require "./ui"

class JavascriptApp

  start: (options) ->

    rem = new Rem()
    rem.start()

    menu = new Menu
      device: options.device
      menuElement: ".js-menu"
      btnElement: ".js-menu-btn"
      activeClass: ".is-active"
      transition: 1000
    menu.start()

    ui = new UI()


module.exports = JavascriptApp
