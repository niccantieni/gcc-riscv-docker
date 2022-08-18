# `gcc-riscv-docker`: a container image for compiling RISC-V 64

This repository contains a `Dockerfile` which builds a container image based on `ubuntu:latest` and installs the gcc-crosscompiler for RISC-V 64. 

## Usage

The script is built with `podman` in mind, but should work just as well with `Docker`. To change this, adjust the comments in the files.


```bash
# make scripts executable
chmod u+x build.sh
chmod u+x compile.sh

# build the container
./build.sh

# compile the file
./compile.sh main.c -o main.o
```
