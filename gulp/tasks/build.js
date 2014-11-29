var gulp = require("gulp");

gulp.task("build", ["clean", "browserify", "styles", "images", "fonts", "html"]);
