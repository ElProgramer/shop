angular
    .module('shop')
    .controller('sesion.controller',
        ['$scope', 'usuario.service', 'ngToast', '$uibModalInstance',
            function ($scope, usuarioService, ngToast, $uibModalInstance) {
                $scope.usuario = "";
                $scope.pass = "";

                $scope.iniciarSesion = function () {
                    usuarioService.iniciarSesion($scope.usuario, $scope.pass)
                        .then(
                            function (success) {

                                if (success.data.length === 0) {
                                    ngToast.create({
                                        className: 'danger',
                                        content: '<a style="color: white">Usuario no existe</a>'
                                    });

                                }
                                else {
                                    ngToast.create("Session iniciada");
                                    $scope.ok(success.data[0]);
                                }


                            }, function (error) {

                            })
                };

                $scope.ok = function (data) {
                    $uibModalInstance.close(data);
                };

                $scope.cancel = function () {
                    $uibModalInstance.dismiss('cancel');
                };


            }]);