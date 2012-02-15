COFFEE = $(shell find node_modules -name "coffee" -type f)
UGLIFY = $(shell find node_modules -name "uglifyjs" -type f)
UGLIFY_FLAGS = --no-mangle 

min: build
	@$(UGLIFY) $(UGLIFY_FLAGS) queryparams.js > queryparams.min.js
		@du -h queryparams*.js

build:
	@$(COFFEE) \
		-c src/queryparams.coffee
	@mv src/queryparams.js .

test:
	@./node_modules/.bin/mocha \
		test/test.coffee

clean:
		@rm queryparams.js && rm queryparams.min.js
		
.PHONY:	build test clean
