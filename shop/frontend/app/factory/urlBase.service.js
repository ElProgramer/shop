angular
    .module('shop')
    .factory("urlBase.service", function () {
        var urlBase = '/api';
        var factory = {};

        factory.getUrlBase = function () {
            return urlBase;
        };

        return factory;
    });