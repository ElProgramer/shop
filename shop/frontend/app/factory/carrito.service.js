angular
    .module('shop')
    .factory("carrito.service", ['$http', 'urlBase.service', function ($http, urlBaseService) {
        var urlBase = urlBaseService.getUrlBase();
        var factory = {};

        factory.getCarrito = function (idcarrito) {
            return $http.get(urlBase + '/carrito/' + idcarrito);
        };

        factory.crearCarrito = function () {
            return $http({
                method: "POST",
                url: urlBase + '/carrito/',
                data: {
                    items_carrito: []
                },
                headers: {
                    'Content-Type': "application/json; charset=utf-8"
                }
            })
        };


        factory.actualizarItems = function (idCarrito, items) {
            return $http({
                method: "PATCH",
                url: urlBase + '/carrito/' + idCarrito + '/',
                data: {
                    items_carrito: items
                },
                headers: {
                    'Content-Type': "application/json; charset=utf-8"
                }
            })
        };

        return factory;
    }]);