#!/usr/bin/env coffee
###


###    
class Envarizer 
  fs = require('fs')
  readline = require('readline')
  Promise = require('bluebird')

  constructor: () ->
    #console.log("cstr")
    @output = [];
  
  ###
  
  ###
  parseFile : (file, option) -> 
    #console.log("working...", file)
    lineReader = readline.createInterface({
      input: fs.createReadStream(file)
    })

    lineReader
    	.on 'line', (line) => 
        @parseExpression(line);
      .on 'close', ()=> 
        return @formatOutput()

  ###
  
  ###
  parseExpression : (text) => 
    pattern = /^export ([A-Za-z0-9_]+)={1}(\"{0,1}|\'{0,1})(.*)(\"{0,1}|\'{0,1})$/
    rePattern = new RegExp(pattern);
    matches = text.match(rePattern);
    if(matches != null || matches is !undefined)
        @output.push {key: matches[1], value : matches[3] }
   
   ###
   
   ###
   formatOutput: =>
    for o in @output
      console.log o 

 module.exports = new Envarizer()
 