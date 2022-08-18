#!/bin/zsh
# Author: Nic Cantieni
# Date: 18.08.2022

# Builds a container image from the Dockerfile.

# podman
podman build -t gcc-riscv-docker:latest .

# docker
# docker build -t gcc-riscv-docker:latest .
