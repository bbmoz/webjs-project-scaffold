exports.config = {
  tests: './test/functional/**/*.js',
  timeout: 10000,
  output: './test/functional/output/',
  helpers: {
    SeleniumWebdriver: {
      url: process.env.WEB_URL,
      browser: 'chrome',
      seleniumAddress: process.env.SELENIUM_HUB_ADDR
    }
  },
  mocha: {}
}
