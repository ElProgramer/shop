angular
    .module('shop')
    .controller('comprar.controller',
        ['$scope', 'usuario.service', 'ngToast', '$uibModalInstance', 'items', 'total', '$sessionStorage', 'carrito.service',
            function ($scope, usuarioService, ngToast, $uibModalInstance, items, total, $sessionStorage, carritoService) {
                $scope.storage = $sessionStorage;
                $scope.total = total;
                $scope.restante = $scope.storage.dinero - total;
                $scope.itemsComprados = [];

                $scope.comprar = function () {

                    usuarioService.getUser($scope.storage.idusuario).then(function (success) {
                        $scope.itemsComprados = success.data.items;

                        var listaItems = items.concat($scope.itemsComprados);

                        usuarioService.addItems($scope.storage.idusuario, listaItems, $scope.restante).then(function (success) {
                            $scope.storage.dinero = $scope.restante;
                            carritoService.actualizarItems($scope.storage.idcarrito, []).then(function (success) {

                                ngToast.create("Se ha echo la compra exitosamente");

                                $scope.ok(success.data);

                            }, function (error) {

                            })
                        }, function (error) {
                            console.log(error);
                        })
                    }, function (error) {

                    });


                };

                $scope.ok = function (data) {
                    $uibModalInstance.close(data);
                };

                $scope.cancel = function () {
                    $uibModalInstance.dismiss('cancel');
                };

            }]);