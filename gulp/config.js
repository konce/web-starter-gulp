var dest = "./public";
var src = "./development";

module.exports = {
  browserSync: {
    server: {
      baseDir: [dest, src]
    },
    files: [
      dest + "/**",
      // Exclude Map files
      "!" + dest + "/**.map"
    ]
  },
  styles: {
    src: src + "/app/assets/stylesheets/**/*.{sass,scss}",
    dest: dest + "/app/assets/stylesheets/",
    settings: {
      sourceComments: "map",
      errLogToConsole: true,
      imagePath: "/app/assets/images",
      includePaths: [
        src + "/vendor/assets/bower_components/",
        src + "/vendor/assets/components/"
      ]
    }
  },
  images: {
    src: src + "/app/assets/images/**",
    dest: dest + "/app/assets/images"
  },
  html: {
    src: src + "/*.html",
    dest: dest
  },
  browserify: {
    // Enable source maps
    debug: true,
    // Additional file extentions to make optional
    extensions: [".coffee", ".hbs"],
    // A separate bundle will be generated for each
    // bundle config in the list below
    bundleConfigs: [{
      entries: src + "/app/assets/javascripts/main.coffee",
      dest: dest + "/app/assets/javascripts/",
      outputName: "main.js"
    }]
  }
};
