PATH := node_modules/.bin:$(PATH)

lint := eslint --report-unused-disable-directives --ext .ts src
build := tsc --outDir dist
clean := rm -rf dist

all: lint test clean build

lint: node_modules
	$(lint)

fix: node_modules
	$(lint) --fix

test: node_modules
	#

clean:
	$(clean)

build: node_modules
	$(build)

watch: node_modules
	$(build) -w

release: all
	git add dist
	standard-version -a

node_modules: package.json
	npm i && touch $@
