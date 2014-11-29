var gulp = require('gulp');
var browserSync = require('browser-sync');
var handleErrors = require('../util/handleErrors');
var config = require('../config').styles;
var $ = require('gulp-load-plugins')();

gulp.task('styles', ['images'], function () {
  return gulp.src(config.src)
    .pipe($.sourcemaps.init())
    .pipe($.sass(config.settings))
    .on('error', handleErrors)
    .pipe($.sourcemaps.write())
    .pipe($.autoprefixer({ browsers: ['last 2 version'] }))
    .pipe(gulp.dest(config.dest))
    .pipe(browserSync.reload({stream:true}));
});
