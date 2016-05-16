assert = require('chai').assert
envarizer = require './../lib/envarizer.coffee'

describe 'test-strings', ->
  describe 'no-quotes', ->
    it 'should return a valid parsed env var', ->
      input = ['export MYVAR=MYSTRING']
      envarizer.parseFile(input)
      assert.equal "MYSTRING", envarizer.formattedOutput['MYVAR']
  
  describe 'no-quotes-ends with white space', ->
    it 'should return a valid parsed env var', ->
      input = ['export MYVAR=MYSTRING']
      envarizer.parseFile(input)
      assert.equal "MYSTRING", envarizer.formattedOutput['MYVAR']
      
   describe 'ends-with-semi', ->
    it 'should return a valid parsed env var', ->
      input = ['export MYVAR=MYSTRING;']
      envarizer.parseFile(input)
      assert.equal "MYSTRING", envarizer.formattedOutput['MYVAR']

  describe 'single-quotes', ->
    it 'should return a valid parsed env var', ->
      input = ["export MYVAR='MYSTRING'"]
      envarizer.parseFile(input)
      assert.equal "MYSTRING", envarizer.formattedOutput['MYVAR']
      
  describe 'double-quotes', ->
    it 'should return an object', ->
      input = ['export MYVAR="MYSTRING"']
      envarizer.parseFile(input)
      assert.equal "MYSTRING", envarizer.formattedOutput['MYVAR']
      
  describe 'text-underscore', ->
    it 'should return a valid parsed env var', ->
      input = ['export MY_VAR=MY_STRING']
      envarizer.parseFile(input)
      assert.equal "MYSTRING", envarizer.formattedOutput['MYVAR'] 
  
   describe 'invalid-text', ->
    it 'should return nothing', ->
      input = ['export MYVAR=MY_+====STRING']
      envarizer.parseFile(input)
      console.log envarizer.formattedOutput['MYVAR'] 
      assert.equal "MYSTRING", envarizer.formattedOutput['MYVAR'] 