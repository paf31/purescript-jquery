module.exports = function(grunt) {

    "use strict";

    grunt.initConfig({

        clean: ["externs", "js"],

        pscMake: {
            lib: {
                src:
                    [ "src/**/*.purs"
                    , "bower_components/purescript-*/src/**/*.purs"
                    ]
            }
        },

        psc: {
            options: {
                main: true,
	        modules: ["Data.Either", "Main"]
            },
            test: {
                src:
                    [ "src/**/*.purs"
                    , "bower_components/purescript-*/src/**/*.purs"
                    , "examples/test.purs"
                    ],
                dest: "js/test.js"
            }
        }

    });

    grunt.loadNpmTasks("grunt-purescript");
    grunt.loadNpmTasks("grunt-contrib-clean");

    grunt.registerTask("default", ["pscMake:lib", "psc:test"]);
    grunt.registerTask("test", ["psc:test"]);
};
