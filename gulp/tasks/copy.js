var gulp = require('gulp');
var $ = require('gulp-load-plugins')();
var config = require('../config').copy;

// Copy All Files At The Root Level (app)
gulp.task('copy', function () {
  if (config.files.length) {
    for (var key in config.files) {
      gulp.src(config.files[key].src, {
        dot: true
      }).pipe(gulp.dest(config.files[key].dest))
        .pipe($.size({title: 'copy'}));
    }
  }
});
