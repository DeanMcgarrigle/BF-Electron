/**
 * Created by dean.mcgarrigle on 10/02/2016.
 */

module.exports = function()  {

    global.$ = global.jQuery = require('jquery');

    /*required modules*/
    require('font-awesome-webpack');
    require('slick-carousel');


    require('angular');
    require('angular-electron');


    /*styles*/
    require('../css/styles.scss');

};
