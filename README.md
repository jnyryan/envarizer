# envarizer
![build-status](https://api.travis-ci.org/jnyryan/envarizer.svg)

takes a bash shell export command and turns it into a json object

Why you ask? I found myself doing it more than once by hand.

## Prerequisite

This is a Node.js package so needs [node.js](https://nodejs.org/en/) runtime.

## Installation

This package is published on [npmjs.com](https://www.npmjs.com/package/envarizer)

```
npm install envarizer
```

## Usage

```
envarizer ./test/test-file.sh
```

example input

``` bash
#!/usr/bin/env bash
export ENV_VAR_A=/var/log
export ENV_VAR_B=a string
export ENV_VAR_C=john.smyth@example.com
```

example output
``` javascript
[ ENV_VAR_A: '/var/log',
  ENV_VAR_B: 'a string',
  ENV_VAR_C: 'john.smyth@example.com' ]
```