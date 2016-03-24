/**
 * Created by dean.mcgarrigle on 12/02/2016.
 */

/*global swal: true*/
'use strict';
class NavCtrl {
    constructor($rootScope, $scope, $animate, common, cfpLoadingBar) {

        activate();

        function activate() {
            common.activateController([], 'footerbar').then(() => {

            });
        }

        $rootScope.$on('cfpLoadingBar:started', function () {
            $scope.status = 0;

            var element = $('#status-icon');

            if(element.hasClass('text-success')){
                element.removeClass('text-success');
            }

            element.addClass('animated pulse text-primary');

            $scope.$watch(
                function () {
                    return cfpLoadingBar.status();
                },
                function (newValue) {
                    $scope.status = Math.round(newValue * 100);
                    if($scope.status === 100 || $scope.status === 0){
                        $scope.status = 100;
                        element.removeClass('animated pulse text-primary');
                        element.addClass('text-success');
                    }
                }
            );
        });
    }
}


module.exports = angular.module('app.footerbar', []).directive('footerbar', function () {
    return {
        controller: NavCtrl,
        controllerAs: 'footerbar',
        template: require('../../html/directives/footerbar.html')
    };
});
