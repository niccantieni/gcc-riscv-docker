# Author: Nic Cantieni
# Date: 18.08.2022


NAME = gcc-riscv-docker
VERSION = latest

BUILDER = podman

DOCKERFILE = Dockerfile

BUILD = $(BUILDER) build . --tag $(NAME):$(VERSION) --file $(DOCKERFILE)

.PHONY: build
build :
	$(BUILD)

.PHONY: nocache
nocache :
	$(BUILD) --no-cache

.PHONY: save
save :
	$(BUILDER) image save -o $(NAME).tar $(NAME):$(VERSION)

.PHONY: clean
clean :
	rm $(NAME).tar