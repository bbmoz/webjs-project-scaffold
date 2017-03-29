const path = require('path')
const webpack = require('webpack')
const vars = require(`./envs/${process.env.NODE_ENV || 'dev'}`)

const $ = {
  webpack: {
    Define: webpack.DefinePlugin,
    Html: require('html-webpack-plugin'),
    Copy: require('copy-webpack-plugin')
  }
}

module.exports = {
  context: path.join(__dirname, 'src'),

  entry: {
    index: './index.js'
  },

  output: {
    path: path.join(__dirname, 'dist'),
    filename: '[name].js'
  },

  module: {
    rules: [{
      test: /\.js$/,
      exclude: /node_modules/,
      use: {
        loader: 'babel-loader',
        options: {
          presets: ['env', 'latest'],
          plugins: ['transform-runtime']
        }
      }
    }]
  },

  plugins: [
    new $.webpack.Define(define(vars)),
    new $.webpack.Html({
      template: './index.html',
      inject: true,
      hash: true,
      minify: {
        collapseWhitespace: true,
        removeComments: true
      }
    }),
    new $.webpack.Copy([
      { from: './**/*.png', flatten: true }
    ])
  ]
}

function define (vars) {
  const newVars = {}
  for (const name of Object.keys(vars)) {
    newVars[name] = JSON.stringify(vars[name])
  }
  return newVars
}
