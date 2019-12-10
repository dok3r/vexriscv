FROM debian:latest
MAINTAINER kost - https://github.com/kost

ENV ARCH=rv32ima

RUN apt-get -qq update && \
apt-get install -yqq --no-show-upgraded -o=Dpkg::Use-Pty=0 autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev git && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
mkdir -p /opt && \
cd /opt && \
git clone --progress --recursive https://github.com/riscv/riscv-gnu-toolchain riscv-gnu-toolchain && \
cd riscv-gnu-toolchain && \
mkdir $ARCH && \
cd $ARCH && \
../configure  --prefix=/opt/$ARCH --with-arch=$ARCH --with-abi=ilp32 && \
make -s -i -j `nproc` && \
cd /opt && \
rm -rf /opt/riscv-gnu-toolchain && \
echo "[success]"

