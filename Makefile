SHELL=/bin/bash
RED=\033[0;31m
GREEN=\033[0;32m
BG_GREY=\033[48;5;237m
NC=\033[0m # No Color

envFileLoc = "$(PWD)/configs/envs/local.env"
envFileProd = "$(PWD)/configs/envs/production.loc.env"

.PHONY: help

help:
	@echo OleksiiHonchar.com automation commands:
	@echo
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build-image: ## Build BE docker image === yarn build-image
	@printf "${BG_GREY}[build] Start${NC}\n"
	@docker build . -f packages/backend/Dockerfile --tag backstage
	@printf "${BG_GREY}[build] Done${NC}\n"
