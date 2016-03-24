/**
 * Created by dean.mcgarrigle on 10/02/2016.
 */

module.exports = function (common, ipcRenderer, cfpLoadingBar, $timeout, $rootScope, $scope) {

    let vm = this;

    vm.status = 0;

    activate();

    function activate() {
        common.activateController([], 'home').then(() => {
            cfpLoadingBar.start();
            $timeout(function () {
                cfpLoadingBar.complete();
                var notification = new Notification("Loading complete..");
            }, 5000);
        });
    }

    //$rootScope.$on('cfpLoadingBar:started', function () {
    //    console.log('loading..');
    //    vm.status = 0;
    //    $scope.$watch(
    //        function () {
    //            return cfpLoadingBar.status();
    //        },
    //        function (newValue) {
    //            vm.status = Math.round(newValue * 100);
    //            if(vm.status === 100 || vm.status === 0){
    //                vm.status = 100;
    //            }
    //        }
    //    );
    //});
};
