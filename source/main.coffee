foo     = require './foo.coffee'
foobar  = require './foobar.coffee'

{ Model } = require 'backbone'

console.log new Model()

console.log foo, foobar



foobar.bar()