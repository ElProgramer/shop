angular
    .module('shop')
    .controller('usuario.controller',
        ['usuario.service', '$scope',
            function (usuarioService, $scope) {
                usuarioService.getUsers().then
                (function success(result) {
                    $scope.usuarios = result.data;
                }, function error(result) {

                });
            }]);
