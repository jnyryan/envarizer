assert = require('chai').assert
fs = require('fs')
envarizer = require './../lib/envarizer.coffee'

loadTestString = (name) ->
  fs.readFileSync "./test/fixtures/#{name}.txt", 'utf8'

describe 'test-strings', ->
  describe 'simple-string', ->
    it 'should return a valid parsed env var', ->
      input = [loadTestString("test_string_1")]
      envarizer.parseFile(input)
      assert.equal "a string", envarizer.formattedOutput['ENV_VAR_A']
  
  describe 'simple-path', ->
    it 'should return a valid parsed env var', ->
      input = [loadTestString("test_string_2")]
      envarizer.parseFile(input)
      assert.equal "/var/log", envarizer.formattedOutput['ENV_VAR_B']
  
  describe 'simple-email', ->
    it 'should return a valid parsed env var', ->
      input = [loadTestString("test_string_3")]
      envarizer.parseFile(input)
      assert.equal "john.smyth@example.com", envarizer.formattedOutput['ENV_VAR_C']
      
  # describe 'single quotes', ->
  #   it 'should return a valid parsed env var', ->
  #     input = [loadTestString("test_string_4")]
  #     envarizer.parseFile(input)
  #     assert.equal "/var/log", envarizer.formattedOutput['ENV_VAR_D']
      
  # describe 'double quotes', ->
  #   it 'should return a valid parsed env var', ->
  #     input = [loadTestString("test_string_5")]
  #     envarizer.parseFile(input)
  #     assert.equal "/var/log", envarizer.formattedOutput['ENV_VAR_E']
      
  
  # describe 'ends with space', ->
  #   it 'should return a valid parsed env var', ->
  #     input = ['export MYVAR=MYSTRING ']
  #     envarizer.parseFile(input)
  #     assert.equal "MYSTRING", envarizer.formattedOutput['MYVAR']
      
  describe 'no-quotes-ends with white space', ->
    it 'should return a valid parsed env var', ->
      input = ['export MYVAR=MYSTRING']
      envarizer.parseFile(input)
      assert.equal "MYSTRING", envarizer.formattedOutput['MYVAR']
      
  # describe 'ends-with-semi', ->
  #   it 'should return a valid parsed env var', ->
  #     input = ['export MYVAR=MYSTRING;']
  #     envarizer.parseFile(input)
  #     assert.equal 'MYSTRING', envarizer.formattedOutput['MYVAR']
  
  describe 'text-underscore', ->
    it 'should return a valid parsed env var', ->
      input = ['export MY_VAR=MY_STRING']
      envarizer.parseFile(input)
      assert.equal "MY_STRING", envarizer.formattedOutput["MY_VAR"] 
  