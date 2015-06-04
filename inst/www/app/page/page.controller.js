/**
 * Angular JS App - OpenCPUDemo
 *
 * Controller - Partial pages
 *
 */

/**
 * Page - Home
 */
opencpuDemoApp.controller('pageFvController', ['$scope', 'opencpuGateService', function($scope, opencpuGateService){

    $scope.ocpuGate = opencpuGateService;

      /**
     * Function - Run basic descriptive
     */
    $scope.plotFimsAndVotes = function() {
        // Prep the params
        var funcName = 'plot_films_n_votes';
        var params = {};

        //
        $scope.ocpuGate.ocpuCall(funcName, params)
            .then(
                /** Successful */
                function(data){
                    console.log(data);
                    $scope.ocpuGate.updated = true;
                }
            );

    };

    var init = function () {
        // check if there is query in url
        // and fire search in case its value is not empty

        $scope.plotFimsAndVotes();
    };
    // and fire it after definition
    init();

}]);

opencpuDemoApp.controller('pageBboController', ['$scope', 'opencpuGateService', function($scope, opencpuGateService){

    $scope.ocpuGate = opencpuGateService;

    /**
     * Function - Run basic descriptive
     */
    $scope.plotBugetAndboxoffice = function() {
        // Prep the params
        var funcName = 'plot_budget_n_boxoffice';
        var params = {};

        //
        $scope.ocpuGate.ocpuCall(funcName, params)
            .then(
            /** Successful */
            function(data){
                console.log(data);
                $scope.ocpuGate.updated = true;
            }
        );

    };

    var init = function () {
        // check if there is query in url
        // and fire search in case its value is not empty

        $scope.plotBugetAndboxoffice();
    };
    // and fire it after definition
    init();

}]);

opencpuDemoApp.controller('pageRatingsController', ['$scope', 'opencpuGateService', function($scope, opencpuGateService){

    $scope.ocpuGate = opencpuGateService;

    /**
     * Function - Run basic descriptive
     */
    $scope.plotRatings = function() {
        // Prep the params
        var funcName = 'plot_ratings';
        var params = {};

        //
        $scope.ocpuGate.ocpuCall(funcName, params)
            .then(
            /** Successful */
            function(data){
                console.log(data);
                $scope.ocpuGate.updated = true;
            }
        );

    };

    var init = function () {
        // check if there is query in url
        // and fire search in case its value is not empty

        $scope.plotRatings();
    };
    // and fire it after definition
    init();

}]);

//=========
opencpuDemoApp.controller('pageLmController', ['$scope', 'opencpuGateService', function($scope, opencpuGateService){

    $scope.ocpuGate = opencpuGateService;

    /**
     * Function - Run basic descriptive
     */
    $scope.plotLengthAndMpaa = function() {
        // Prep the params
        var funcName = 'plot_length_n_mpaa';
        var params = {};

        //
        $scope.ocpuGate.ocpuCall(funcName, params)
            .then(
            /** Successful */
            function(data){
                console.log(data);
                $scope.ocpuGate.updated = true;
            }
        );

    };

    var init = function () {
        // check if there is query in url
        // and fire search in case its value is not empty

        $scope.plotLengthAndMpaa();
    };
    // and fire it after definition
    init();

}]);


//=========
opencpuDemoApp.controller('pageGenresController', ['$scope', 'opencpuGateService', function($scope, opencpuGateService){

    $scope.ocpuGate = opencpuGateService;

    /**
     * Function - Run basic descriptive
     */
    $scope.plotGenres = function() {
        // Prep the params
        var funcName = 'plot_genre';
        var params = {};

        //
        $scope.ocpuGate.ocpuCall(funcName, params)
            .then(
            /** Successful */
            function(data){
                console.log(data);
                $scope.ocpuGate.updated = true;
            }
        );

    };

    var init = function () {
        // check if there is query in url
        // and fire search in case its value is not empty

        $scope.plotGenres();
    };
    // and fire it after definition
    init();

}]);


//=========
opencpuDemoApp.controller('pageBoController', ['$scope', 'opencpuGateService', function($scope, opencpuGateService){

    $scope.ocpuGate = opencpuGateService;

    /**
     * Function - Run basic descriptive
     */
    $scope.plotBoxofficeAndOthers = function() {
        // Prep the params
        var funcName = 'plot_bo_vs_others';
        var params = {};

        //
        $scope.ocpuGate.ocpuCall(funcName, params)
            .then(
            /** Successful */
            function(data){
                console.log(data);
                $scope.ocpuGate.updated = true;
            }
        );

    };

    var init = function () {
        // check if there is query in url
        // and fire search in case its value is not empty

        $scope.plotBoxofficeAndOthers();
    };
    // and fire it after definition
    init();

}]);


//=========
opencpuDemoApp.controller('pageBobrController', ['$scope', 'opencpuGateService', function($scope, opencpuGateService){

    $scope.ocpuGate = opencpuGateService;

    /**
     * Function - Run basic descriptive
     */
    $scope.plotBoxofficeAndBudgetRatio = function() {
        // Prep the params
        var funcName = 'plot_bo_bt_ratio_vs_others';
        var params = {};

        //
        $scope.ocpuGate.ocpuCall(funcName, params)
            .then(
            /** Successful */
            function(data){
                console.log(data);
                $scope.ocpuGate.updated = true;
            }
        );

    };

    var init = function () {
        // check if there is query in url
        // and fire search in case its value is not empty

        $scope.plotBoxofficeAndBudgetRatio();
    };
    // and fire it after definition
    init();

}]);
