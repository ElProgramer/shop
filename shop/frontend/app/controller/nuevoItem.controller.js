angular
    .module('shop')
    .controller('nuevoItem.controller',
        ['$scope', 'item.service', 'ngToast', '$uibModalInstance', '$sessionStorage', '$http', 'Upload', 'consola.service', 'genero.service', '$filter',
            function ($scope, itemService, ngToast, $uibModalInstance, $sessionStorage, $http, Upload, consolaService, generoService, $filter) {
                $scope.storage = $sessionStorage;
                $scope.nombre = "";
                $scope.img = "";
                $scope.valido = "false";
                $scope.descripcion = "";
                $scope.precio = 0;
                $scope.opened = false;
                $scope.fechaSalida = new Date();
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
                    angular.forEach(success.data, function (value, index) {
                        value["isSelected"] = false;
                    });
                    $scope.consolas = success.data;
                });

                generoService.getGeneros().then(function (success) {
                    angular.forEach(success.data, function (value, index) {
                        value["isSelected"] = false;
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

                $scope.crearItem = function () {
                    validarCampos();
                    if ($scope.valido === true) {
                        $scope.valido = false;

                        console.log($scope.img);
                        var data = new FormData;
                        data = acomodarObjeto($scope.consolas, "idconsola", data, 'consolas_ids');
                        data = acomodarObjeto($scope.generos, "idgenero", data, 'generos_ids');
                        data.append("nombre", $scope.nombre);
                        data.append('descripcion', $scope.descripcion);
                        data.append('precio', $scope.precio);
                        var truedate = $filter('date')($scope.fechaSalida, "yyyy-MM-dd");
                        data.append('fecha_salida', truedate);
                        data.append('imagen', $scope.img);
                        $http({
                            method: 'POST',
                            url: 'http://127.0.0.1:8000/api/item/',
                            data: data, headers: {'Content-Type': undefined},
                            transformRequest: angular.identity
                        }).then(function (response) {
                                ngToast.create("El item se a creado exitosamente");
                                $scope.ok(response);
                            },
                            function (error) {
                                var errormsj = "";
                                angular.forEach(error.data, function (value, index) {
                                    errormsj = errormsj + index + ': ' + value + "<br><br>"
                                });
                                ngToast.create({
                                    className: 'warning',
                                    content: '<a style="color: white" href="#" class="">' + errormsj + '</a>'
                                });
                            });
                    } else{
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