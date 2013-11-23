module.exports = (grunt) ->
    
    DEBUG = not grunt.cli.options.production

    grunt.initConfig
        pkg: grunt.file.read('package.json')
        browserify:
            vendor:
                src: ['node_modules/underscore/underscore.js', 'node_modules/backbone/backbone.js']
                dest: 'build/vendor.js'
                options:
                    shim:
                        underscore:
                            path: 'node_modules/underscore/underscore.js'
                            exports: '_'
                        backbone:
                            path: 'node_modules/backbone/backbone.js'
                            exports: 'backbone'
            app:
                src: ['source/main.coffee']
                dest: 'build/app.js'
                options:
                    external: ['underscore']
                    transform: ['coffeeify']
                    extension: ['coffee']
                    debug: DEBUG

        compass:
            dist:
                options:
                    sassDir: 'source'
                    cssDir: 'build'
                    extensionsDir: 'node_modules'

        uglify:
            options:
                compress:
                    global_defs:
                        "DEBUG": DEBUG
                    dead_code: true
            my_target:
                files:
                    'build/app.min.js': ['build/app.js']

    grunt.loadNpmTasks('grunt-browserify')
    grunt.loadNpmTasks('grunt-contrib-compass')
    grunt.loadNpmTasks('grunt-contrib-uglify')

    grunt.registerTask('default', ['browserify','uglify','compass'])
    grunt.registerTask('build', ['browserify'])



