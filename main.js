/**
 * Created by dean.mcgarrigle on 10/02/2016.
 */

var electron = require('electron');
var app = electron.app;
var BrowserWindow = electron.BrowserWindow;
var ipc = require('ipc');

var mainWindow = null;

app.on('window-all-closed', function(){
    if(process.platform != 'darwin'){
        app.quit();
    }
});

app.on('ready', function(){

    mainWindow = new BrowserWindow({
        width: 1000,
        height: 675,
        'min-height': 675,
        'min-width': 1000,
        'max-height': 675,
        'max-width': 1000,
        frame: false,
        transparent: true
    });

    mainWindow.loadUrl('file:///' + __dirname + '/app/index.html');

    mainWindow.openDevTools();

    mainWindow.on('closed', function(){
        mainWindow = null;
    });

});
