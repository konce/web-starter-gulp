var browserSync = require('browser-sync');
var changed     = require('gulp-changed');
var config      = require('../../config/sprites');
var gulp = require('gulp');
var gulpif = require('gulp-if');
var sprite = require('css-sprite').stream;

// generate sprite.png and _sprite.scss
gulp.task('sprites', function () {
  return gulp.src(config.src)
    .pipe(changed(config.dest)) // Ignore unchanged files
    .pipe(sprite(config.sprite))
    .pipe(gulpif('*.png', gulp.dest(config.dest), gulp.dest(config.sassDest)))
    .pipe(browserSync.reload({stream:true}));
});
