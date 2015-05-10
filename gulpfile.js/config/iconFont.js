var config = require('./')
var fontConfig = require('./fonts')

module.exports = {
  name: 'Gulp Starter Icons',
  src: config.sourceAssets + '/icons/*.svg',
  dest: fontConfig.dest,
  sassDest: config.sourceAssets + '/stylesheets/components/',
  template: './gulpfile.js/tasks/iconFont/template.scss',
  sassOutputName: '_icons.scss',
  fontPath: '../../assets/fonts',
  className: 'icon-font',
  options: {
    fontName: 'icons',
    appendCodepoints: true,
    normalize: false
  }
}
