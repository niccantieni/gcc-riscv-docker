# `gcc-riscv-docker`: a container image for compiling RISC-V 64

This repository contains a toolchain for building and running containers (i.e. with Docker or Podman) in order to compile and run RISC-V 64 in the container.

## Usage

### Building the container
The whole thing is built with `make`.

If you want to use Docker instead of Podman, adjust `BUILDER` in the `Makefile`.

```bash
# build the image
make build

# build the image without using cached results
make nocache

# export the image to gcc-riscv-docker.tar
make save

# delete the .tar
make clean
```

### Using the container

An exemplary usage is in `./example`, and there is a separate `Makefile`.

If you want to use Docker instead of Podman, adjust `RUNNER` in the `Makefile`.

To adjust which files are built, change `COMPILE_FILES` and `COMPILE_OUT` in the `Makefile` accordingly.

```bash
cd example

# compile main.c to main.o
make compile

# run main.o with spike and a proxy-kernel (pk)
make run

# just start a container and connect a shell (for inspection etc.)
# ATTN: The container is deleted, only the contents of the outside
# local directory will be kept
make login
```
