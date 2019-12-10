# VexRiscv
Dockerized gcc cross compiler for VexRiscv found at: https://github.com/SpinalHDL/VexRiscv and https://github.com/riscv/riscv-gnu-toolchain

# Examples

Run docker:

```
docker run -it dok3r/vexriscv
```

# Usage

Simple example:

```
export PATH=/opt/$ARCH/bin:$PATH
export CC=riscv32-unknown-elf-gcc
export CXX=riscv32-unknown-elf-g++
```

Compiler is located in /opt/rv32ima





