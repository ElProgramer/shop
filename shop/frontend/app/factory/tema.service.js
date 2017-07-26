angular
    .module('shop')
    .factory("tema.service",['$http','urlBase.service', function ($http,urlBaseService) {
        var urlBase = urlBaseService.getUrlBase();
        var factory = {};

        factory.getTemas = function (nombreForo, pagina, cantidad) {
            return $http.get(urlBase + '/temas/' + nombreForo + "/" + pagina + "/" + cantidad);
        };

        factory.setTema = function (titulo, contenido, idForo, nick) {
            console.log(contenido);
            return $http({
                method: "POST",
                url: urlBase + '/temas/',
                data: {
                    titulo: titulo,
                    contenido: contenido,
                    idForo: idForo,
                    nick: nick

                },
                headers: {
                    'Content-Type': "application/json; charset=utf-8"
                }
            })
        };

        return factory;
    }]);