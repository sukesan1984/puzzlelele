test:
	mocha -R progress --compilers coffee:coffee-script test/*.coffee

.PHONY: test
