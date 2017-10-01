.DEFAULT_GOAL := help

IMAGE_NAME=takumakei/google-app-engine-go:173.0.0

MKFILE_PATH:=$(abspath $(lastword $(MAKEFILE_LIST)))
PROJECT_DIR=$(abspath $(dir $(MKFILE_PATH))/../..)

.PHONY: help

help: ## show this message
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%5s\033[0m: %s\n", $$1, $$2}'

.PHONY: build
build: ## build docker image
	docker build --tag $(IMAGE_NAME) .

.PHONY: push
push: ## push docker image
	docker push $(IMAGE_NAME)

.PHONY: run
run: ## run docker image
	docker run -it --rm -v $(PROJECT_DIR):/root/repo $(IMAGE_NAME) bash
