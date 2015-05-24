var config = require('./')

module.exports = {
  autoprefixer: { browsers: ['last 2 version'] },
  src: config.sourceAssets + "/stylesheets/main.scss",
  watch: config.sourceAssets + "/stylesheets/**/*.scss",
  dest: config.publicAssets + '/stylesheets',
  settings: {
    imagePath: 'assets/images',
    includePaths: [config.sourceBower, config.sourceComponents],
    sourceMap: 'sass',
    sourceComments: "map",
    errLogToConsole: true
  }
}
