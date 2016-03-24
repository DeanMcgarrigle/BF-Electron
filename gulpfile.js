/**
 * Created by dean.mcgarrigle on 10/02/2016.
 */

var gulp = require("gulp");
var gutil = require("gulp-util");
var webpack = require("webpack");
var webpackDev = require("webpack-dev-server");
var electron = require('gulp-atom-electron');
var symdest = require('gulp-symdest');
var run = require("gulp-run");
var packageJson = require("./package.json");
var webpackConfig = require("./webpack.config.js");

gulp.task("Development", function (callback) {
    var myConfig = Object.create(webpackConfig);
    myConfig.devtool = "eval";
    myConfig.debug = true;
    myConfig.dev = true;

    new webpackDev(webpack(myConfig), {
        stats: {
            colors: true
        },
        historyApiFallback: true,
        proxy: {
            "*": "http://localhost:10000"
        }
    }).listen(10000, "localhost", function (err) {
        if (err) throw new gutil.PluginError("web-dev", err);
        gutil.log("[web-dev]", "http://localhost:10000");
    });
    run('electron .').exec();
});

gulp.task("Build Production Files", function (callback) {
    var myConfig = Object.create(webpackConfig);
    myConfig.dev = false;
    webpack(myConfig, function (err, stats) {
        if (err) throw new gutil.PluginError("webpack", err);
        gutil.log("[webpack]", stats.toString())
    });
    callback();

});

gulp.task("Package EXE", function () {
    gulp.src('./')
        .pipe(run(packageJson.scripts.package));
});


gulp.task("Package MSI", function () {
    gulp.src('./')
        .pipe(run(packageJson.scripts.deploy));
});
