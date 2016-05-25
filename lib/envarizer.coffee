#!/usr/bin/env coffee
###
Use RegEx to pull out the environment variable from inputted text
###    
class Envarizer 
  
  constructor: (@format = 'json') ->
    @matchedExpressions = [];
    @formattedOutput = [];
  
  ###
  Loop all data and format it as required
  ###
  parseFile : (fileData) => 
    for line in fileData
      @parseExpression(line);
    switch @format
      when 'array'
        @formattedOutput = JSON.stringify @matchedExpressions
      when 'json'
       for item in @matchedExpressions
        @formattedOutput[item.key] = item.value

  ###
  Parse the line looking for lines that are environment variable export statements.
  
  begins with export
  then string up to =
  then optional quotes
  then any string
  then optional quotes
  
  ###
  parseExpression : (text) => 
    pattern = /^export ([A-Za-z0-9_]+)={1}(\"{0,1}|\'{0,1})(.*)(\"{0,1}|\'{0,1})/
    rePattern = new RegExp(pattern);
    matches = text.match(rePattern);
    if(matches != null || matches is !undefined)
      console.log "-->", matches
      @matchedExpressions.push {key: matches[1], value : matches[3] }
   
  ###
  Print what we have formatted to stdout
  ###
  print: =>
    console.log @formattedOutput
    
 module.exports = new Envarizer()
 