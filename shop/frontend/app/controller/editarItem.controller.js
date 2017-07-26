angular
    .module('shop')
    .controller('editarItem.controller',
        ['$scope', 'item.service', 'consola.service', 'genero.service', 'ngToast', '$uibModalInstance', '$sessionStorage', '$http', 'item', '$filter',
            function ($scope, itemService, consolaService, generoService, ngToast, $uibModalInstance, $sessionStorage, $http, item, $filter) {
                $scope.storage = $sessionStorage;
                $scope.nombre = item.nombre;
                $scope.img = "";
                $scope.valido = false;
                $scope.descripcion = item.descripcion;
                $scope.precio = item.precio;
                $scope.opened = false;
                $scope.fechaSalida = new Date(item.fecha_salida);
                $scope.dateOptions = {
                    formatYear: 'yy',
                    maxDate: new Date(),
                    startingDay: 1
                };
                $scope.format = 'yyyy-MM-dd';
                $scope.open = function () {
                    $scope.opened = true;
                };

                consolaService.getConsolas().then(function (success) {
                    angular.forEach(success.data, function (consola1, index) {
                        angular.forEach(item.consolas_item, function (consola2, index) {
                            consola1["isSelected"] = consola1.idconsola === consola2.idconsola;

                        });
                    });
                    $scope.consolas = success.data;
                });

                generoService.getGeneros().then(function (success) {
                    angular.forEach(success.data, function (genero1, index) {
                        angular.forEach(item.generos_item, function (genero2, index) {
                            genero1["isSelected"] = genero1.idgenero === genero2.idgenero;

                        });
                    });
                    $scope.generos = success.data;
                });

                function acomodarObjeto(object, indexName, formdata, inputname) {
                    console.log(object);
                    angular.forEach(object, function (value, index) {
                        if (value.isSelected === true) {
                            console.log(value[indexName]);
                            formdata.append(inputname, value[indexName]);
                        }
                    });
                    return formdata;
                }

                validarCampos = function () {
                    var valido1, valido2
                    angular.forEach($scope.consolas, function (value, index) {
                        if (value["isSelected"] === true) {
                            valido1 = "true";
                        }

                    });

                    angular.forEach($scope.generos, function (value, index) {
                        if (value["isSelected"] === true) {
                            valido2 = "true";
                        }

                    });
                    if (valido1 && valido2) {
                        $scope.valido = true;
                    }
                };

                $scope.editarItem = function () {
                    validarCampos();
                    if ($scope.valido === true) {
                        $scope.valido = false;

                        var data = new FormData;
                        data = acomodarObjeto($scope.consolas, "idconsola", data, 'consolas_ids');
                        data = acomodarObjeto($scope.generos, "idgenero", data, 'generos_ids');
                        data.append("nombre", $scope.nombre);
                        data.append('descripcion', $scope.descripcion);
                        data.append('precio', $scope.precio);
                        var truedate = $filter('date')($scope.fechaSalida, "yyyy-MM-dd");
                        data.append('fecha_salida', truedate);
                        if ($scope.img !== []) {
                            data.append('imagen', $scope.img);
                        }

                        $http({
                            method: 'PATCH',
                            url: 'http://127.0.0.1:8000/api/item/' + item.iditem + '/',
                            data: data, headers: {'Content-Type': undefined},
                            transformRequest: angular.identity
                        }).then(function (success) {
                                ngToast.create("El item se a editado exitosamente");
                                $scope.ok(success);
                            },
                            function (error) {
                                console.log(error)
                            });
                    } else {
                        ngToast.create({
                            className: 'warning',
                            content: '<a style="color: white" href="#" class="">Generos o consolas requeridos </a>'
                        });
                    }
                };

                $scope.ok = function (data) {
                    $uibModalInstance.close(data);
                };

                $scope.cancel = function () {
                    $uibModalInstance.dismiss('cancel');
                };


            }]);