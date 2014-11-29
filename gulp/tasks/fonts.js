var gulp = require('gulp');
var $ = require('gulp-load-plugins')();
var config = require('../config').fonts;

// Copy Web Fonts To Public
gulp.task('fonts', function() {
  return gulp.src(config.src)
    .pipe(gulp.dest(config.dest))
    .pipe($.size({title: 'fonts'}));
});
