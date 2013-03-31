test:
	mocha --recursive -R progress --compilers coffee:coffee-script test
test-debug:
	mocha --recursive -R -d progress --compilers coffee:coffee-script test

.PHONY: test
