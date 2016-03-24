/**
 * Created by dean.mcgarrigle on 10/02/2016.
 */

var webpack = require('webpack');
var extract = require("extract-text-webpack-plugin");

APP = __dirname;

module.exports = {
    entry: {
        app: ['webpack/hot/dev-server', './app/core/entry.js']
    },
    output: {
        path: APP,
        filename: 'build/bundle.js'
    },
    module: {
        loaders: [
            { test: /\.js$/, loader: 'babel', query: {cacheDirectory: true, presets: ['es2015']},exclude: /node_modules/ },
            { test: /\.css$/, loader: 'style-loader!css-loader' },
            { test: /\.scss$/, loader: "style-loader!css-loader!sass-loader?" },
            { test: /\.less$/, loader: 'style-loader!css-loader!less-loader' },
            { test: /\.html/, loader: 'raw' },
            { test: /\.json/, loader: 'json' },
            { test: /\.ico$/, loader: 'url-loader?mimetype=image/ico' },
            { test: /\.(jpg|png|gif)?(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: 'file-loader?name=img/[name].[ext]' },
            { test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: "url-loader?name=fonts/[name].[ext]&limit=10000&minetype=application/font-woff" },
            { test: /\.(ttf|eot|svg)?(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: "file-loader?name=fonts/[name].[ext]" }
        ]
    },
    plugins: [
        //new webpack.optimize.UglifyJsPlugin({minimize: true, mangle: false}),
        new webpack.HotModuleReplacementPlugin()
    ]
};
