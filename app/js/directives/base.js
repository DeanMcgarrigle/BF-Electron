/**
 * Created by dean.mcgarrigle on 10/02/2016.
 */

module.exports = angular.module('app.base', []).directive('base', function(){
    return {
        template: require('../../html/directives/base.html')
    };
});

