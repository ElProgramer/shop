angular
    .module('shop')
    .controller('main.controller',
        ['item.service', '$scope', '$stateParams',
            function (itemService, $scope, $stateParams) {
                itemService.getItems($stateParams.busqueda).then
                (function success(result) {
                    console.log(result);
                    $scope.items = result.data;
                }, function error(result) {

                });
            }]);
