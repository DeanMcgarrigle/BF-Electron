/**
 * Created by dean.mcgarrigle on 10/02/2016.
 */

require('./vendor.js')();

const appModule = require('../index');

angular.element(document).ready(function(){
    angular.bootstrap(document, [appModule.name],  {

    });
});