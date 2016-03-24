/**
 * Created by dean.mcgarrigle on 10/02/2016.
 */

module.exports = angular.module('app', [
    require('angular-ui-router'),
    require('angular-animate'),
    require('angular-loading-bar'),

    'angular-electron',

    require('./js/common/common.js').name,
    require('./js/services/router.js').name,
    require('./js/directives/base.js').name,
    require('./js/directives/footerbar.js').name,
    require('./js/directives/sidebar.js').name
]);