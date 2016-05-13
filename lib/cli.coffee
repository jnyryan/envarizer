#!/usr/bin/env coffee
doc = """

Usage:
  envarizer <file>

Options:
  -h --help            show this help message and exit
  --version            show version and exit
"""

{docopt} = require 'docopt'
version = require('../package.json').version
parameters = docopt(doc, version: version)
envarizer = require './envarizer2.coffee'
envarizer.parseFile(process.argv[2], '')

