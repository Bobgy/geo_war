module.exports = (grunt) ->
  # Project configuration.
  grunt.initConfig(
    pkg:
      grunt.file.readJSON('package.json')
    coffeeify:
      options:
        browserifyOptions:
          extensions: ['.coffee']
        debug: true
      game:
        src: 'src/client.coffee'
        dest: 'js/bundle.js'
    browserify:
      options:
        browserifyOptions:
          extensions: ['.coffee']
          debug: true
        transform: ['coffeeify']
      client:
        src: 'src/Client.coffee'
        dest: 'js/client.js'
      server:
        src: 'src/Server.coffee'
        dest: 'js/server.js'
    watch:
      files: ['src/**/*.coffee', 'server.coffee']
      ###
      files: ['src/*.coffee',
              'src/scripts/skills/*.coffee',
              'src/scripts/*.coffee',
              'src/scripts/patterns/*.coffee',
              'src/lib/*.coffee']
      ###
      tasks: ['browserify']
  )

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-browserify')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-coffeeify')

  # Default task(s).
  grunt.registerTask('default', ['browserify'])
