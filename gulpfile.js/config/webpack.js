var paths           = require('./')
var webpack         = require('webpack')
var webpackManifest = require('../lib/webpackManifest')

module.exports = function(env) {

  var jsSrc = paths.sourceAssets + '/javascripts/'
  var jsDest = paths.publicAssets + '/javascripts/'
  var publicPath = 'assets/javascripts/'

  var webpackConfig = {
    entry: {
      main: [jsSrc + 'main.js'],
      flux: [jsSrc + 'flux.jsx']
    },

    output: {
      path: jsDest,
      filename: env === 'production' ? '[name]-[hash].js' : '[name].js',
      publicPath: publicPath
    },

    plugins: [
      new webpack.ResolverPlugin(
        new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin("bower.json", ["main"])
      )
    ],

    resolve: {
      modulesDirectories: ['node_modules', 'vendor/assets/bower_components', 'vendor/assets/components'],
      extensions: ['', '.js', '.jsx', '.cjsx', '.coffee']
    },

    module: {
      loaders: [
        { test: /\.js$/, loader: 'babel-loader?stage=1', exclude: /node_modules/ },
        { test: /\.jsx$/, loader: 'babel-loader?stage=1', exclude: /node_modules/ },
        { test: /\.cjsx$/, loaders: ['coffee', 'cjsx']},
        { test: /\.coffee$/, loader: 'coffee' }
      ]
    }
  }

  if(env !== 'test') {
    // Factor out common dependencies into a shared.js
    webpackConfig.plugins.push(
      new webpack.optimize.CommonsChunkPlugin({
        name: 'vendor',
        filename: env === 'production' ? '[name]-[hash].js' : '[name].js',
      })
    )
  }

  if(env === 'development') {
    webpackConfig.devtool = 'source-map'
    webpack.debug = true
  }

  if(env === 'production') {
    webpackConfig.plugins.push(
      new webpackManifest(publicPath, 'public'),
      new webpack.DefinePlugin({
        'process.env': {
          'NODE_ENV': JSON.stringify('production')
        }
      }),
      new webpack.optimize.DedupePlugin(),
      new webpack.optimize.UglifyJsPlugin(),
      new webpack.NoErrorsPlugin()
    )
  }

  return webpackConfig
}
