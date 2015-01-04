var gulp = require('gulp');
var browserSync = require('browser-sync');
var handleErrors = require('../util/handleErrors');
var config = require('../config').styles;
var $ = require('gulp-load-plugins')();

var AUTOPREFIXER =  ['ie >= 10', 'ie_mob >= 10', 'ff >= 30', 'chrome >= 34', 'safari >= 7', 'opera >= 23', 'ios >= 7', 'android >= 4.4', 'bb >= 10'];

gulp.task('styles', ['images'], function () {
  return gulp.src(config.src)
    .pipe($.sass(config.settings))
    .on('error', handleErrors)
    .pipe($.sourcemaps.init())
    .pipe($.sourcemaps.write())
    .pipe($.autoprefixer({ brçowsers: AUTOPREFIXER }))
    .pipe(gulp.dest(config.dest))
    .pipe($.size({title: 'styles'}))
    .pipe(browserSync.reload({stream:true}));
});

gulp.task('styles:production', ['images'], function () {
  return gulp.src(config.src)
    .pipe($.sass(config.settings))
    .on('error', handleErrors)
    .pipe($.sourcemaps.init())
    .pipe($.sourcemaps.write())
    .pipe($.autoprefixer({ browsers: AUTOPREFIXER }))
    .pipe($.if('*.css', $.csso())) // Concatenate And Minify Styles
    .pipe(gulp.dest(config.dest))
    .on('end', function() {
      gulp.src(config.dest + '**/*.css')
        .pipe($.gzip())
        .pipe(gulp.dest(config.dest));
    })
    .pipe($.size({title: 'styles'}))
    .pipe(browserSync.reload({stream:true}));
});
