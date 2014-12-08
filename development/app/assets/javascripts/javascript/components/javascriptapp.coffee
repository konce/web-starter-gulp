"use strict"

Base = require "./../../components/base/base"

Menu = require "./menu"

class JavascriptApp extends Base

  start: (options) ->
    menu = new Menu
      device: options.device
      menu: ".menu"
      btn: ".js-menu-toggle"
      active: ".is-active"
    menu.start()

module.exports = JavascriptApp
