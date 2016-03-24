/**
 * Created by dean.mcgarrigle on 12/02/2016.
 */

/*global swal: true*/
'use strict';
class NavCtrl {
    constructor($scope, common) {

        this.app = require('../services/routes.json');

        activate();

        function activate() {
            common.activateController([], 'sidebar').then(() => {

            });
        }

        $scope.select = function (item) {
            $scope.selected = item;
        };
        
        $(document).ready(function(){
            $('.nav-sidebar').slick({
                vertical: true,
                arrows: true,
                centerMode: true,
                centerPadding: '94px',
                slidesToShow: 3,
                focusOnSelect: true,
                speed: 150,
                infinite: true,
                prevArrow: "<i class='fa fa-caret-up' style='cursor:pointer;'</i>",
                nextArrow: "<i class='fa fa-caret-down' style='cursor:pointer;'</i>"
            });
        });
    }
}

module.exports = angular.module('app.sidebar', []).directive('sidebar', function () {
    return {
        controller: NavCtrl,
        controllerAs: 'sidebar',
        template: require('../../html/directives/sidebar.html')
    };
});
