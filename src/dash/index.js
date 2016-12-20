import angular from 'angular';
import uiRouter from 'angular-ui-router';

import dashCtrl from './dash.controller';

const dashTpl = require('./dash.tpl.html');

function routes($stateProvider) {
    $stateProvider.state('root.dash', {
        url:'/dash',
        template: dashTpl,
        controller: 'dashCtrl',
        controllerAs: '$ctrl'
    })
}

routes.$inject = ['$stateProvider'];

export default angular.module('dash', [uiRouter])
    .config(routes)
    .controller('dashCtrl', dashCtrl)
    .name;