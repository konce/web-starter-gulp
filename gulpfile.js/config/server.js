var config = require('./')

module.exports = {
  root: process.cwd() + config.publicDirectory.substr(1),
  port: process.env.PORT || 8080,
  logLevel: process.env.NODE_ENV ? 'combined' : 'dev',
  staticOptions: {
    extensions: ['html'],
    maxAge: '31556926'
  }
}
