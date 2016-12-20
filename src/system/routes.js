const homeTpl = require('./home.tpl.html');

function routes($urlRouterProvider, $stateProvider) {

    $urlRouterProvider.otherwise('/');

    $stateProvider
        .state('root', {
            abstract: true,
            template:'<div ui-view></div>'
        })
        .state('root.home',{
            url:'/',
            template: homeTpl
        });
}

routes.$inject = ['$urlRouterProvider', '$stateProvider'];

export default routes;