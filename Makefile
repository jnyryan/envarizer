#!/usr/bin/make -f

test:
	@./node_modules/.bin/mocha --reporter progress --compilers coffee:coffee-script/register

.PHONY: test