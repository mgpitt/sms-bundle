import angular from 'angular';
import uiRouter from 'angular-ui-router';

function routes($stateProvider) {
    $stateProvider.state('root.dash', {
        url:'/dash',
        template:'Dashboard'
    })
}

routes.$inject = ['$stateProvider'];

export default angular.module('dash', [uiRouter]).name;