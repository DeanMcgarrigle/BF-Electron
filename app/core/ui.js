/**
 * Created by dean.mcgarrigle on 10/02/2016.
 */

'use strict';

(function () {

    const remote = require('remote');
    const BrowserWindow = remote.require('browser-window');
    const Menu = remote.require('menu');
    const MenuItem = remote.require('menu-item');

    const currentWindow = remote.getCurrentWindow();
    let rightClick = null;

    //function init() {
    //    document.getElementById("min-btn").addEventListener("click", (e) => {
    //        var window = BrowserWindow.getFocusedWindow();
    //        window.minimize();
    //    });
    //
    //    document.getElementById("max-btn").addEventListener("click", (e) => {
    //        var window = BrowserWindow.getFocusedWindow();
    //        window.maximize();
    //    });
    //
    //    document.getElementById("close-btn").addEventListener("click", (e) => {
    //        var window = BrowserWindow.getFocusedWindow();
    //        window.close();
    //
    //    });
    //}
    //document.onreadystatechange = () => {
    //    if (document.readyState == "complete") {
    //        init();
    //    }
    //};

    let menu = new Menu();

    menu.append(new MenuItem(
        {
            label: 'Inspect Element',
            click: () =>{
                currentWindow.inspectElement(rightClick.x, rightClick.y);
            }
        }));

    window.addEventListener('contextmenu',(e) =>{
        e.preventDefault();
        rightClick = { x: e.x, y: e.y };
        menu.popup(currentWindow);
    }, false);

    // This function checks if the specified event is supported by the browser.
    // Source: http://perfectionkills.com/detecting-event-support-without-browser-sniffing/
    function isEventSupported(eventName) {
        var el = document.createElement('div');
        eventName = 'on' + eventName;
        var isSupported = (eventName in el);
        if (!isSupported) {
            el.setAttribute(eventName, 'return;');
            isSupported = typeof el[eventName] == 'function';
        }
        el = null;
        return isSupported;
    }

    $(document).ready(function() {
        // Check which wheel event is supported. Don't use both as it would fire each event
        // in browsers where both events are supported.
        var wheelEvent = isEventSupported('mousewheel') ? 'mousewheel' : 'wheel';

        // Now bind the event to the desired element
        $('.nav-sidebar').on(wheelEvent, function(e) {
            var oEvent = e.originalEvent,
                delta  = oEvent.deltaY || oEvent.wheelDelta;

            // deltaY for wheel event
            // wheelData for mousewheel event

            if (delta > 0) {
                // Scrolled up
                $('.nav-sidebar').slick('slickNext');
            } else {
                // Scrolled down
                $('.nav-sidebar').slick('slickPrev');
            }
        });
    });

})();