"use strict"

class Rem

    rem: ->
      w = window
      d = document
      e = d.documentElement
      g = d.getElementsByTagName("body")[0]
      screenWidth = w.innerWidth or e.clientWidth or g.clientWidth
      newRootFontSize = (10 / 2560) * screenWidth
      if screenWidth < 1025 and screenWidth > 767
        newRootFontSize = newRootFontSize * 1.5
      else
        newRootFontSize = newRootFontSize * 3  if screenWidth < 768
      document.documentElement.style.fontSize = newRootFontSize + "px"
      return
      rem()
      if window.addEventListener
        window.addEventListener "resize", rem
      else
        window.attachEvent "resize", rem

    start: ->
      @rem()

module.exports = Rem
