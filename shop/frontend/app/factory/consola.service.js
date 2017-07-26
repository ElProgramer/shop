angular
    .module('shop')
    .factory("consola.service",['$http','urlBase.service', function ($http,urlBaseService) {
        var urlBase = urlBaseService.getUrlBase();
        var factory = {};

        factory.getConsolas = function () {
        return $http.get(urlBase+'/consola');
        };

        return factory;
    }]);