//npm modules
import angular from 'angular';
import uiRouter from 'angular-ui-router';

//sms modules
import routes from './system/routes';
import sysCtrl from './system/controller';
import dash from './dash';

//css
import './bs_or.css';
import './sms.css';

//main angular app
angular.module('sms',[uiRouter, dash])
    .config(routes)
    .controller('sysCtrl', sysCtrl);