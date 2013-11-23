_ = require 'underscore'



module.exports = ->
    if DEBUG
        console.log 'Debug mode!'
    else
        console.log 'Production mode!'
    throw new Error _.first(['bar','bar2','bar3'])