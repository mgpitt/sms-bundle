import angular from 'angular';
import uiRouter from 'angular-ui-router';

import routes from './system/routes';

angular.module('sms',[uiRouter]).config(routes);