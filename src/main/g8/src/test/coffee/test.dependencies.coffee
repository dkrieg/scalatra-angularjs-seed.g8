# These are required for Jasmine to execute correctly
EnvJasmine.loadGlobal "src/test/js-lib/require-2.0.6.js"
EnvJasmine.loadGlobal "src/test/js-lib/jquery-1.8.1.js"
EnvJasmine.loadGlobal EnvJasmine.testDir + "/require.conf.js"

# Add webapp JS files here
EnvJasmine.loadGlobal "src/test/js-lib/angular/angular.min.js"
EnvJasmine.loadGlobal "src/test/js-lib/angular/angular-mocks.js"
EnvJasmine.loadGlobal "src/test/js-lib/underscore-min.js"
EnvJasmine.loadGlobal EnvJasmine.libDir + "/ui-bootstrap-tpls-0.1.0.min.js"
