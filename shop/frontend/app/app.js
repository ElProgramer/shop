angular.module('shop', ['ui.router', 'ngStorage', 'ui.bootstrap', 'ngSanitize', 'ngToast', 'angular.filter', 'ngFileUpload',
    'ngProgress', 'ngAnimate'])
    .config(['$urlRouterProvider', '$stateProvider',

        function ($urlRouterProvider, $stateProvider) {
            $stateProviderRef = $stateProvider;
            $urlRouterProvider.otherwise('/');

            $stateProvider.state('app', {
                abstract: true,
                views: {
                    nav: {
                        templateUrl: 'static/app/view/nav.html',
                        controller: 'nav.controller'
                    },

                    '': {
                        templateUrl: 'static/app/view/content.html',
                        controller: 'main.controller'
                    }

                }
            }).state('app.cuenta', {
                url: "/cuenta/",
                controller: 'cuenta.controller',
                templateUrl: 'static/app/view/cuenta.html'

            }).state('app.usuarios', {
                url: "/usuarios/",
                controller: 'usuario.controller',
                templateUrl: 'static/app/view/usuarios.html'

            }).state('app.busqueda', {
                url: "/{busqueda}",
                controller: 'main.controller',
                params: {
                    busqueda: ""
                },
                templateUrl: 'static/app/view/main.html'


            }).state("app.item", {
                url: "/item/{item}",
                params: {
                    item: null
                },
                onEnter: function ($state, $stateParams) {
                    if ($stateParams.item === null) {
                        $state.go("app.busqueda")
                    }
                },
                templateUrl: 'static/app/view/item.html',
                controller: 'item.controller'
            }).state("app.carrito", {
                url: "/carrito/",
                templateUrl: 'static/app/view/carrito.html',
                controller: 'carrito.controller'
            });

        }]);