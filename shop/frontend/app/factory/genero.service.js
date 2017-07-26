angular
    .module('shop')
    .factory("genero.service",['$http','urlBase.service', function ($http,urlBaseService) {
        var urlBase = urlBaseService.getUrlBase();
        var factory = {};

        factory.getGeneros = function () {
        return $http.get(urlBase+'/genero');
        };

        return factory;
    }]);