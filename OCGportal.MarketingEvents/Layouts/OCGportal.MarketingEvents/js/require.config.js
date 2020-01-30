requirejs.config({
    "baseUrl": "js",
    "paths": {
        "jquery": "libs/jquery-3.1.1.min",
        "jqueryui": "libs/jquery-ui-1.12.1.min",
        "datetimepicker": "libs/jquery-ui-timepicker-addon",
        "bootstrap": "libs/bootstrap.bundle.min",
        "knockout": "libs/knockout-3.5.0",        
        "helpers": "helpers/helper",        
        "spscripts": 'libs/sp.loader.core',
        "domready" : 'libs/domReady',
        "camljs": 'libs/camljs',       
        "kobindings": 'libs/knockout-custom',
        "validator": 'libs/validator',
        "fileinput": 'libs/fileinput.min',
        "moment": 'libs/moment.min'
        
    },
    //urlArgs: "v=5",
    shim: {      
        'bootstrap': { 'deps': ['jquery', 'jqueryui'] }, 
        'datetimepicker': { 'deps': ['jquery', 'jqueryui'] },
        'validator': { 'deps': ['jquery'] }
    },
});

