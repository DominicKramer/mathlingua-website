
.PHONY: build
build:
	mkdocs build

.PHONY: serve
serve:
	mkdocs serve

.PHONY: deploy
deploy:
	mkdocs gh-deploy

.PHONY: setup
setup:
	pip3 install mkdocs && pip3 install mkdocs-material && pip3 install pymdown-extensions

