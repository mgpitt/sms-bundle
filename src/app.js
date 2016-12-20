import angular from 'angular';
import uiRouter from 'angular-ui-router';

import routes from './system/routes';
import sysCtrl from './system/controller';
import dash from './dash';

angular.module('sms',[uiRouter, dash])
    .config(routes)
    .controller('sysCtrl', sysCtrl);