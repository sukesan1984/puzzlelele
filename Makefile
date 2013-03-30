test:
	mocha -R progress --compilers coffee:coffee-script t/*.coffee

.PHONY: test
