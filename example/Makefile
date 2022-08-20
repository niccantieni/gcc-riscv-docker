# Author: Nic Cantieni
# Date: 18.08.2022

# Runs a temporary (--rm) container of the image gccriscv:latest, and mounts the current working directory into /builddir in the container, sets that as the working directory and invoces riscv64-linux-gnu-gcc with COMPILER_FLAGS

NAME = gcc-riscv-docker
RUNNER = podman

CONTAINER = gcc-riscv-docker
CONTAINER_VERSION = latest
CONTAINER_IDENT = $(CONTAINER):$(CONTAINER_VERSION)

VOLUME_LOCAL = $$PWD
VOLUME_CONTAINER = /builddir

CONTAINER_FLAGS = --rm --name $(NAME) \
		--volume $(VOLUME_LOCAL):$(VOLUME_CONTAINER) \
		--workdir $(VOLUME_CONTAINER) \

# COMPILE #

COMPILE_FILES = main.c
COMPILE_OUT = main.o

COMPILER = riscv64-unknown-elf-gcc

COMPILE_CONTAINER_FLAGS = $(CONTAINER_FLAGS) \
		--entrypoint $(COMPILER) \

COMPILER_FLAGS = -c -O3 -Wno-int-conversion -Wall \
				-march=rv64ima -mabi=lp64

COMPILE = $(RUNNER) run $(COMPILE_CONTAINER_FLAGS) $(CONTAINER_IDENT) $(COMPILER_FLAGS) $(COMPILE_FILES) -o $(COMPILE_OUT)

# RUN WITH SPIKE #

SPIKE = spike
PK = /usr/local/riscv64-linux-gnu/bin/pk

RUN_CONTAINER_FLAGS = $(CONTAINER_FLAGS) \
		--entrypoint $(SPIKE) \

RUNNER_FLAGS = -d $(PK)

RUN = $(RUNNER) run $(RUN_CONTAINER_FLAGS) $(CONTAINER_IDENT) $(RUNNER_FLAGS) $(COMPILE_OUT)

# LOGIN TO CONTAINER #

LOGIN_CONTAINER_FLAGS = $(CONTAINER_FLAGS) -it

LOGIN = $(RUNNER) run $(LOGIN_CONTAINER_FLAGS) $(CONTAINER_IDENT)

.PHONY: compile
compile :
	$(COMPILE)

.PHONY: run
run :
	$(RUN)

.PHONY: login
login :
	$(LOGIN)
