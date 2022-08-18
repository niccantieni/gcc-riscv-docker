#!/bin/zsh
# Author: Nic Cantieni
# Date: 18.08.2022

# Runs a temporary (--rm) container of the image gccriscv:latest, and mounts the current working directory into /builddir in the container, sets that as the working directory, invoces riscv64-linux-gnu-gcc and passes all arguments to this script through to riscv64-linux-gnu-gcc.

podman run --rm --entrypoint riscv64-linux-gnu-gcc --volume $PWD:/builddir --workdir /builddir  --name gcc-riscv-docker gcc-riscv-docker:latest "$@"

# docker run --rm --entrypoint riscv64-linux-gnu-gcc --volume $PWD:/builddir --workdir /builddir  --name gcc-riscv-docker gcc-riscv-docker:latest "$@"
