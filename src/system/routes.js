const navTpl = require('./nav.tpl.html');

function routes($urlRouterProvider, $stateProvider) {

    $urlRouterProvider.otherwise('/dash');

    $stateProvider
        .state('root', {
            abstract: true,
            views: {
                nav: {
                    template: navTpl,
                },
                main: {
                    template: '<div ui-view class="fx-fade-normal"></div>'
                }
            }
        });
}

routes.$inject = ['$urlRouterProvider', '$stateProvider'];

export default routes;