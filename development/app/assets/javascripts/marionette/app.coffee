Marionette = require "marionette"

App = do (Backbone, Marionette) ->

  App = new Marionette.Application()

  App.rootRoute = ''

  App.navigate = (route, options) ->
    options or (options = {})
    Backbone.history.navigate route, options

  App.getCurrentRoute = ->
    Backbone.history.fragment

  App.addRegions
    mainRegion: '#layout-region'

  App.on "before:start", (options) ->

  App.addInitializer =>
    require "./config/routes"
    require "./components/base/base_controller"
    require "./components/base/base_entities"
    require "./components/base/base_router"
    require "./components/base/base_views"
    require "./entities/entities"

  App.on 'start', ->
    if Backbone.history
      Backbone.history.start
        pushState: true
      if @getCurrentRoute() is ''
        @navigate(@rootRoute, trigger: true)


module.exports = App
