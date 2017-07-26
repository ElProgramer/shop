angular
    .module('shop')
    .factory("item.service",['$http','urlBase.service', function ($http,urlBaseService) {
        var urlBase = urlBaseService.getUrlBase();
        var factory = {};

        factory.getItems = function (busqueda) {
        return $http.get(urlBase+'/item'+busqueda);
        };

        return factory;
    }]);