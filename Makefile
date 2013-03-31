test:
	mocha --recursive -R spec --compilers coffee:coffee-script test
test-debug:
	mocha --recursive -R -d spec --compilers coffee:coffee-script test

.PHONY: test
