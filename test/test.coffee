assert = require('chai').assert
envarizer = require './../lib/envarizer2.coffee'

describe 'test-strings', ->
  describe 'no-quotes', ->
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
      assert.equal "\'MYSTRING\'", envarizer.formattedOutput['MYVAR']
      
  describe 'double-quotes', ->
    it 'should return an object', ->
      input = ['export MYVAR="MYSTRING"']
      envarizer.parseFile(input)
      assert.equal "\"MYSTRING\"", envarizer.formattedOutput['MYVAR']
      
      
      