var config = require('./')

module.exports = {
  autoprefixer: { browsers: ['last 2 version'] },
  src: config.sourceAssets + "/stylesheets/main.scss",
  dest: config.publicAssets + '/stylesheets',
  settings: {
    imagePath: 'assets/images',
    loadPath: [__dirname + "vendor/assets/bower_components/"],
    errLogToConsole: true
  }
}
