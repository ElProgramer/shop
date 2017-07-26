angular
    .module('shop')
    .factory("usuario.service", ['$http', 'urlBase.service', function ($http, urlBaseService) {
        var urlBase = urlBaseService.getUrlBase();
        var factory = {};

        factory.iniciarSesion = function (nick, pass) {
            return $http({
                method: "GET",
                url: urlBase + '/usuario/?usuario='+nick+'&password='+pass,
                headers: {
                    'Content-Type': "application/json; charset=utf-8"
                }
            })


        };

        factory.getUser = function (idusuario) {
            return $http({
                method: "GET",
                url: urlBase + '/usuario/'+idusuario+"/",
                headers: {
                    'Content-Type': "application/json; charset=utf-8"
                }
            })


        };

        factory.getUsers = function () {
            return $http({
                method: "GET",
                url: urlBase + '/usuario/',
                headers: {
                    'Content-Type': "application/json; charset=utf-8"
                }
            })


        };

        factory.registrarse = function (nick, nombre, apellido, email, pass) {
            return $http({
                method: "POST",
                url: urlBase + '/usuario/',
                data: {

                    usuario: nick,
                    nombre: nombre,
                    apellido: apellido,
                    correo: email,
                    password: pass,
                    tipo_idtipo: 1
                },
                headers: {
                    'Content-Type': "application/json; charset=utf-8"
                }
            })
        };

        factory.addCarrito = function (idusuario,idcarrito) {
            return $http({
                method: "PATCH",
                url: urlBase + '/usuario/'+idusuario+"/",
                data: {
                    carrito_idcarrito: idcarrito
                },
                headers: {
                    'Content-Type': "application/json; charset=utf-8"
                }
            })
        };

        factory.addItems = function (idusuario,items,dinero) {
            return $http({
                method: "PATCH",
                url: urlBase + '/usuario/'+idusuario+"/",
                data: {
                    items: items,
                    dinero: dinero
                },
                headers: {
                    'Content-Type': "application/json; charset=utf-8"
                }
            })
        };


        return factory;
    }]);