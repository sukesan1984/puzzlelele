test:
	mocha -R progress --compilers coffee:coffee-script test/*.coffee
test-debug:
	mocha -R -d progress --compilers coffee:coffee-script test/*.coffee

.PHONY: test
