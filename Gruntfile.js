module.exports = function(grunt) {

    "use strict";

    grunt.initConfig({

        clean: ["externs", "js"],

        "purescript-make": {
            options: {
                tco: true,
                magicDo: true
            },
            lib: {
                src:
                    [ "src/**/*.purs.hs"
                    , "bower_components/purescript-*/src/**/*.purs"
                    ]
            }
        },

        purescript: {
            options: {
                tco: true,
                magicDo: true,
                main: true
            },
            test: {
                src:
                    [ "src/**/*.purs.hs"
                    , "bower_components/purescript-*/src/**/*.purs"
                    , "examples/test.purs.hs"
                    ],
                dest: "js/test.js"
            }
        }

    });

    grunt.loadNpmTasks("grunt-purescript");
    grunt.loadNpmTasks("grunt-contrib-clean");

    grunt.registerTask("default", ["purescript-make:lib"]);
    grunt.registerTask("test", ["purescript:test"]);
};
