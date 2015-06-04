/**
 * Angular JS App - OpenCPUDemo
 *
 * Root App Routes Config
 *
 */

opencpuDemoApp.config([ '$routeProvider', '$locationProvider',
    function($routeProvider, $locationProvider){
        // Use the HTML5 History API
        $locationProvider.html5Mode(false);

        // Config the routes
        $routeProvider
            .when('/', {
                templateUrl: 'app/page/page-home.html'
            })
            .when('/fv', {
                templateUrl: 'app/page/page-fv.html',
                controller: 'pageFvController'
            })
            .when('/bbo', {
                templateUrl: 'app/page/page-bbo.html',
                controller: 'pageBboController'
            })
            .when('/ratings', {
                templateUrl: 'app/page/page-ratings.html',
                controller: 'pageRatingsController'
            })
            .when('/lm', {
                templateUrl: 'app/page/page-lm.html',
                controller: 'pageLmController'
            })
            .when('/genres', {
                templateUrl: 'app/page/page-genres.html',
                controller: 'pageGenresController'
            })
            .when('/bo', {
                templateUrl: 'app/page/page-bo.html',
                controller: 'pageBoController'
            })
            .when('/bobr', {
                templateUrl: 'app/page/page-bobr.html',
                controller: 'pageBobrController'
            })
            .otherwise({
                redirectTo: '/'
            });
    }]);


