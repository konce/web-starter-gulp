var gulp = require("gulp");

gulp.task("development", [ "browserify", "styles", "images", "fonts", "html", "copy"]);

gulp.task("production", [ "browserify:production", "styles:production", "images", "fonts", "html", "copy"]);
