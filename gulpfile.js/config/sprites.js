var config = require('./')

module.exports = {
  src: config.sourceAssets + '/sprites/*.png',
  sassDest: config.sourceAssets + '/stylesheets/components/',
  dest: config.publicAssets + '/sprites',
  sprite: {
    retinaSrcFilter: [config.sourceAssets.substr(2) + '/sprites/*-2x.png'],
    retinaImgName: 'sprite-2x.png',
    retinaImgPath: '../sprites/sprite-2x.png',
    imgName: 'sprite.png',
    imgPath: '../sprites/sprite.png',
    cssName: '_sprites.scss',
    padding: 1,
    algorithm: 'top-down',
    cssTemplate: './gulpfile.js/tasks/sprites/handlebarsInheritance.scss.handlebars'
  }
}
