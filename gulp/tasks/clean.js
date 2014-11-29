var gulp = require('gulp');
var del = require('del');
var clean = require('../config').clean;

gulp.task('clean', del.bind(null, clean.files, {dot: true}));
