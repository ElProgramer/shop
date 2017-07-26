angular
    .module('shop')
    .controller('item.controller',
        ['item.service', '$scope', 'ngProgressFactory', '$stateParams', '$sessionStorage', 'carrito.service', 'usuario.service', '$uibModal', '$state',
            function (itemService, $scope, ngProgressFactory, $stateParams, $sessionStorage, carritoService, usuarioService, $uibModal, $state) {
                $scope.storage = $sessionStorage;

                usuarioService.getUser($scope.storage.idusuario).then(function (success) {
                    if (success.data.items.indexOf(Number($stateParams.item)) === -1) {
                        $scope.comprado = false;
                    } else {
                        $scope.comprado = true;
                    }

                }, function (error) {

                });

                $scope.addCart = function () {

                    carritoService.getCarrito($scope.storage.idcarrito)
                        .then(function (success) {

                            $scope.items_carrito = success.data.items_carrito;

                            $scope.items_carrito.push($stateParams.item);

                            carritoService.actualizarItems($scope.storage.idcarrito, $scope.items_carrito)
                                .then(function (success) {
                                    $scope.inCarrito = true;

                                }, function (error) {

                                });


                        }, function (error) {

                        });

                };

                $scope.removeCart = function () {

                    carritoService.getCarrito($scope.storage.idcarrito)
                        .then(function (success) {

                            $scope.items_carrito = success.data.items_carrito;
                            var index = $scope.items_carrito.indexOf(Number($stateParams.item));
                            $scope.items_carrito.splice(index, 1);

                            console.log(index);
                            console.log($scope.items_carrito);

                            carritoService.actualizarItems($scope.storage.idcarrito, $scope.items_carrito)
                                .then(function (success) {

                                    $scope.inCarrito = false;

                                }, function (error) {

                                });


                        }, function (error) {

                        });

                };
                $scope.items_carrito = [];
                itemService.getItems("/" + $stateParams.item).then
                (function success(result) {
                    $scope.item = result.data;

                    carritoService.getCarrito($scope.storage.idcarrito)
                        .then(function (success) {

                            $scope.items_carrito = success.data.items_carrito;
                            console.log($scope.items_carrito);
                            console.log($scope.items_carrito);
                            console.log($stateParams.item);
                            console.log($scope.items_carrito.indexOf(Number($stateParams.item)));

                            if ($scope.items_carrito.indexOf(Number($stateParams.item)) === -1) {
                                $scope.inCarrito = false;
                            } else {
                                $scope.inCarrito = true;
                            }


                        }, function (error) {

                        });

                }, function error(result) {

                });

                $scope.editarItem = function () {
                    modalInstance = $uibModal.open({
                        templateUrl: 'static/app/template/editarItem.html',
                        controller: 'editarItem.controller',
                        size: "lg", resolve: {
                            item: function () {
                                return $scope.item;
                            }
                        }

                    });

                    modalInstance.result.then(function (data) {
                        $state.reload();
                    }, function () {

                    });


                };


            }]);