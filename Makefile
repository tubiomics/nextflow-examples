# Self-Documented Makefile see https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html

REVISION := head
PROFILE := default
DB_IDENTIFIER := default
MESSAGE :=

.DEFAULT_GOAL := help

.PHONY: help
# Put it first so that "make" without argument is like "make help".
help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-32s-\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: clean
clean:  ## clean project
	@rm -rf work* \
	rm -rf .nextflow*
