/**
 * Created by dean.mcgarrigle on 10/02/2016.
 */

module.exports = angular.module('app.routing', []).provider('router', function ($stateProvider) {

        var urlCollection;

        this.$get = function ($http, $state) {
            return {
                setUpRoutes: function () {
                    var collection = require('../services/routes.json');
                    for (var routeName in collection) {
                        if (collection.hasOwnProperty(routeName)) {
                            if (!$state.get(routeName)) {

                                var c = collection[routeName];
                                if (c.group === null){
                                    c.group = "";
                                }
                                if (c.views === null){
                                    c.views = "";
                                }
                                $stateProvider.state(
                                    c.name, {
                                        url: c.url,
                                        template: require('../../html/views/' + c.name.toLowerCase() + '.html'),
                                        controller: require('../controllers/' + c.name.toLowerCase() + '.js'),
                                        controllerAs: c.controllerAs,
                                        hideNav:(c.hideNav === 'true'),
                                        group: c.group
                                    }
                                );
                            }
                        }
                    }
                }
            };
        };

        this.setCollectionUrl = function (url) {
            urlCollection = url;
        };
    })

    .config(function ($stateProvider, $urlRouterProvider, routerProvider) {

            $urlRouterProvider.otherwise('/manage');

            routerProvider.setCollectionUrl('../js/services/routes.json');
        }
    )
    .controller('MainController', function ($scope, router) {
        $scope.reload = function () {
            router.setUpRoutes();
        };
    })

    .run(function (router) {
        router.setUpRoutes();
    });

