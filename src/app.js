import angular from 'angular';
import uiRouter from 'angular-ui-router';

import routes from './system/routes';
import sysCtrl from './system/controller';

angular.module('sms',[uiRouter])
    .config(routes)
    .controller('sysCtrl', sysCtrl);