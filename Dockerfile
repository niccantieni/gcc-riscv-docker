FROM ubuntu:latest

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y build-essential gdb-multiarch qemu-system-misc gcc-riscv64-linux-gnu binutils-riscv64-linux-gnu
