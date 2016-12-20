
function routes($urlRouterProvider, $stateProvider) {

    $urlRouterProvider.otherwise('/');

    $stateProvider
        .state('root', {
            abstract: true,
            views: {
                main: {
                    template: 'Main View <div ui-view></div>',
                }
            }
        })
}

routes.$inject = ['$urlRouterProvider', '$stateProvider'];

export default routes;