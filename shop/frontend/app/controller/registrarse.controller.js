angular
    .module('shop')
    .controller('registrarse.controller',
        ['$scope', 'usuario.service', 'ngToast', '$uibModalInstance', 'carrito.service',
            function ($scope, usuarioService, ngToast, $uibModalInstance, carritoService) {
                $scope.usuario = "";
                $scope.nombre = "";
                $scope.apellido = "";
                $scope.email = "";
                $scope.pass = "";
                $scope.registrarse = function () {
                    usuarioService.registrarse($scope.usuario, $scope.nombre, $scope.apellido, $scope.email, $scope.pass)
                        .then(
                            function (success) {
                                var idusuario = success.data.idusuario;

                                carritoService.crearCarrito().then(
                                    function (success) {
                                        var idcarrito = success.data.idcarrito;

                                        usuarioService.addCarrito(idusuario, idcarrito)
                                            .then(function (success) {
                                                ngToast.create("Usuario creado exitosamente");
                                                $scope.ok(success);

                                            }, function (error) {

                                                var errormsj = "";
                                                angular.forEach(error.data, function (value, index) {
                                                    errormsj = errormsj + index + ': ' + value + "<br><br>"
                                                });
                                                ngToast.create({
                                                    className: 'warning',
                                                    content: '<a style="color: white" href="#" class="">' + errormsj + '</a>'
                                                });


                                            })

                                    }, function (error) {

                                        var errormsj = "";
                                        angular.forEach(error.data, function (value, index) {
                                            errormsj = errormsj + index + ': ' + value + "<br><br>"
                                        });
                                        ngToast.create({
                                            className: 'warning',
                                            content: '<a style="color: white" href="#" class="">' + errormsj + '</a>'
                                        });

                                    })
                            }, function (error) {
                                var errormsj = "";
                                angular.forEach(error.data, function (value, index) {
                                    errormsj = errormsj + index + ': ' + value + "<br><br>"
                                });
                                ngToast.create({
                                    className: 'warning',
                                    content: '<a style="color: white" href="#" class="">' + errormsj + '</a>'
                                });

                            })
                };

                $scope.ok = function (data) {
                    $uibModalInstance.close(data);
                };

                $scope.cancel = function () {
                    $uibModalInstance.dismiss('cancel');
                };


            }]);