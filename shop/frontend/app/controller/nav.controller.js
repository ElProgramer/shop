angular
    .module('shop')
    .controller('nav.controller',
        ['$scope', '$uibModal', '$sessionStorage', 'ngToast', 'usuario.service', 'consola.service', 'genero.service', '$state',
            function ($scope, $uibModal, $sessionStorage, ngToast, usuarioService, consolaService, generoService, $state) {
                $scope.text = [];
                $scope.consolas = [];
                $scope.consola = "";
                $scope.generos = [];
                $scope.busqueda = "";

                $scope.buscar = function (busqueda, generos, consola) {
                    var ruta = "";
                    ruta = ruta + "?nombre__icontains=" + busqueda;
                    angular.forEach(generos, function (value, index) {
                        if (value.isSelected === true) {
                            ruta = ruta + "&generos_item=" + value.idgenero
                        }
                    });
                    ruta = ruta + "&consolas_item=" + consola;
                    $state.go('app.busqueda', {busqueda: ruta});

                };

                consolaService.getConsolas().then(function (success) {
                    $scope.consolas = success.data;
                    $scope.consola = success.data[0].idconsola;
                });

                generoService.getGeneros().then(function (success) {
                    angular.forEach(success.data, function (value, index) {
                        value["isSelected"] = false;
                    });
                    $scope.generos = success.data;
                });
                $scope.text.login = "Iniciar Sesion";
                $scope.text.register = "Registrarse";
                $scope.text.nuevoItem = '<span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span> Nuevo item';
                $scope.storage = $sessionStorage;
                init();
                $scope.iniciarSesion = function () {
                    modalInstance = $uibModal.open({
                        templateUrl: 'static/app/template/iniciarSesion.html',
                        controller: 'sesion.controller',
                        size: "md"

                    });

                    modalInstance.result.then(function (data) {
                        console.log(data);
                        console.log(data.usuario);
                        console.log($scope.storage.usuario);
                        $scope.storage.usuario = data.usuario;
                        $scope.storage.idtipo = data.tipo_idtipo;
                        $scope.storage.idcarrito = data.carrito_idcarrito;
                        $scope.storage.dinero = data.dinero;
                        $scope.storage.idusuario = data.idusuario;
                    }, function () {

                    });

                };

                $scope.registrarse = function () {
                    modalInstance = $uibModal.open({
                        templateUrl: 'static/app/template/registrarse.html',
                        controller: 'registrarse.controller',
                        size: "md"

                    });

                    modalInstance.result.then(function (data) {
                    }, function () {

                    });

                };

                $scope.nuevoItem = function () {
                    modalInstance = $uibModal.open({
                        templateUrl: 'static/app/template/nuevoItem.html',
                        controller: 'nuevoItem.controller',
                        size: "lg"

                    });

                    modalInstance.result.then(function (data) {
                        $state.reload();

                    }, function () {

                    });


                };

                $scope.cerrarSesion = function () {
                            $sessionStorage.$reset();
                            ngToast.create("Session cerrada correctamente")
                };

                function init() {
                    if (typeof $scope.storage.usuario === 'undefined' || $scope.storage.usuario === null) {
                        $scope.storage.usuario = null;
                    }
                }
            }]);