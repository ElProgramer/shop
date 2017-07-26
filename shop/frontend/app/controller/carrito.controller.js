angular
    .module('shop')
    .controller('carrito.controller',
        ['carrito.service', '$scope', 'ngProgressFactory', '$sessionStorage', 'ngToast', '$state', '$uibModal',
            function (carritoService, $scope, ngProgressFactory, $sessionStorage, ngToast, $state, $uibModal) {
                $scope.storage = $sessionStorage;
                $scope.items = [];

                $scope.precioTotal = 0;

                carritoService.getCarrito($scope.storage.idcarrito).then(function (success) {
                    $scope.items = success.data.items;
                    $scope.iditems = success.data.items_carrito;

                    angular.forEach($scope.items, function (value, index) {
                        $scope.precioTotal = $scope.precioTotal + value.precio;
                    })
                }, function (error) {

                });


                $scope.removeCart = function (iditem) {

                    carritoService.getCarrito($scope.storage.idcarrito)
                        .then(function (success) {

                            $scope.items_carrito = success.data.items_carrito;
                            var index = $scope.items_carrito.indexOf(iditem);
                            $scope.items_carrito.splice(index, 1);
                            console.log(index);
                            console.log($scope.items_carrito);

                            carritoService.actualizarItems($scope.storage.idcarrito, $scope.items_carrito)
                                .then(function (success) {
                                    console.log("quitado");
                                    $state.reload();
                                    $scope.inCarrito = false;

                                }, function (error) {

                                });


                        }, function (error) {

                        });

                };

                $scope.comprar = function () {

                    modalInstance = $uibModal.open({
                        templateUrl: 'static/app/template/comprar.html',
                        controller: 'comprar.controller',
                        size: "md",
                        resolve: {
                            items: function () {
                                return $scope.iditems;
                            },
                            total: function () {
                                return $scope.precioTotal;
                            }
                        }

                    });

                    modalInstance.result.then(function (data) {
                        $state.reload();
                    }, function () {

                    });

                }

            }]);