var config = require('./')

module.exports = {
  src: config.sourceAssets + "/sprites/**",
  sassDest: config.sourceAssets + '/stylesheets/components/',
  dest: config.publicAssets + "/sprites",
  sassOutputName: '_sprites.scss',
  sprite: {
    name: 'sprite',
    style: '_sprites.scss',
    cssPath: '../../../assets/sprites/',
    processor: 'scss',
    retina: true,
    prefix: 'icon-sprite',
    orientation: 'vertical',
    watch: true,
    base64: true,
    template: './gulpfile.js/tasks/sprites/template.scss',
    margin: 2,
    interpolation: "moving-average"
  }
}
