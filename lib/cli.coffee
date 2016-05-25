#!/usr/bin/env coffee
doc = """

Usage:
  envarizer <file>

Options:
  -o --output          the output format [default=json]
  -h --help            show this help message and exit
  --version            show version and exit
"""

{docopt} = require 'docopt'
version = require('../package.json').version
parameters = docopt(doc, version: version)
byline = require 'byline'
envarizer = require './envarizer.coffee'
fs = require('fs')

stream = fs.createReadStream(parameters['<file>']);
stream = byline.createStream(stream);
fileData = []
stream
  .on 'data', (line) -> 
    fileData.push line.toString()
  .on 'end', ->
    envarizer.parseFile(fileData)
    envarizer.print()



