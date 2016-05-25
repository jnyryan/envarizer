# Development 

Useful information when developing this

# Build

To run locally after cloning the repository

```
git clone https://github.com/jnyryan/envarizer.git
cd envarizer
npm install
npm link
envarizer ./test/test-file.txt
```

## Local Testing

To test on you local machine, run the test scripts

```
npm test
```
or
```
make test
```

## CI Testing

Continous Integration is provided by [Travis](https://travis-ci.org/)

This projects build status and history is located on:  [https://travis-ci.org/jnyryan/envarizer](https://travis-ci.org/)


## Packaging

```
npm login
npm publish
```

Once published the package is located: [https://www.npmjs.com/package/envarizer](https://www.npmjs.com/package/envarizer)
