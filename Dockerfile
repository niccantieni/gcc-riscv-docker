FROM ubuntu:latest

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y build-essential gdb-multiarch qemu-system-misc gcc-riscv64-linux-gnu binutils-riscv64-linux-gnu git binutils-riscv64-unknown-elf gcc-riscv64-unknown-elf device-tree-compiler

WORKDIR /root

RUN git clone https://github.com/riscv-software-src/riscv-isa-sim.git
WORKDIR riscv-isa-sim
RUN mkdir build
WORKDIR build

RUN ../configure
RUN make
RUN make install

WORKDIR /root
run git clone https://github.com/riscv-software-src/riscv-pk.git
WORKDIR riscv-pk
RUN mkdir build
WORKDIR build
RUN ../configure --host=riscv64-linux-gnu
RUN make
RUN make install

WORKDIR /root
RUN echo "export PATH=\"/usr/local/riscv64-linux-gnu/bin:$PATH\"" >> .bashrc
