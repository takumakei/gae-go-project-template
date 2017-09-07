.DEFAULT_GOAL := help

.PHONY: help

help: ## show this message
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%8s\033[0m: %s\n", $$1, $$2}'

.PHONY: run
run: ## dev_appserver.py
	bin/run.sh

.PHONY: test
test: ## go test
	bin/test.sh

.PHONY: lint
lint: ## golint
	bin/lint.sh

.PHONY: deploy
deploy: ## deploy --no-promote
	bin/deploy.sh --no-promote

.PHONY: promote
promote: ## deploy --promote
	bin/deploy.sh --promote

.PHONY: glide
glide: ## glide update
	bin/glide-update.sh

.PHONY: go-get
go-get: ## go get -u (no-glide packages)
	bin/go-get.sh
