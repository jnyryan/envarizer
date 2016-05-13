'use strict'
var fs = require('fs')
    ,readline = require('readline');

class envarizer {
  constructor() {
    console.log("cstr")
    this.output = [];
  }
  
  parseExpression2 (exp){
    //var rePattern = new RegExp(/^Subject:(.*)$/);
    //let matches = strText.match(rePattern);
  }
  
  doWork(file, option) {
    console.log("working...", file)
    var lineReader = readline.createInterface({
      input: fs.createReadStream(file)
    });

    lineReader.on('line', function (line) {
      let match = envarizer.parseExpression(line);
      //console.log(this.output)
    });
    
    console.log('Done')
  }
  
  static parseExpression (text){
    let pattern = /^export ([A-Za-z0-9_]+)={1}(\"{0,1}|\'{0,1})(.*)(\"{0,1}|\'{0,1})$/
    let rePattern = new RegExp(pattern);
    let matches = text.match(rePattern);
    if(matches != null || matches === !undefined)
        console.log (matches[1]);
        //return new  {key: matches[1], value : matches[3] };
  }
  
}

module.exports = new envarizer();


