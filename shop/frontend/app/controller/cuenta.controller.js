angular
    .module('shop')
    .controller('cuenta.controller',
        ['usuario.service', '$scope', '$sessionStorage',
            function (usuarioService, $scope, $sessionStorage) {
                $scope.storage = $sessionStorage;
                usuarioService.getUser($scope.storage.idusuario).then
                (function success(result) {
                    $scope.items = result.data.lista_items;
                }, function error(result) {

                });
            }]);
