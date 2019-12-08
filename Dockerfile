FROM debian:latest
MAINTAINER kost - https://github.com/kost

ENV ARCH=rv32im ARCHI=rv32i

RUN apt-get -qq update && \
apt-get install -yq autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev git && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
mkdir -p /opt && \
cd /opt && \
git clone --recursive https://github.com/riscv/riscv-gnu-toolchain riscv-gnu-toolchain && \
cd riscv-gnu-toolchain && \
rm -rf $ARCH && \
mkdir $ARCH && \
cd $ARCH && \
../configure  --prefix=/opt/$ARCH --with-arch=$ARCH --with-abi=ilp32 && \
make -j `nproc` && \
cd .. && \
rm -rf $ARCHI && \
mkdir $ARCHI && \
cd $ARCHI && \
../configure  --prefix=/opt/$ARCHI --with-arch=$ARCHI --with-abi=ilp32 && \
make -j `nproc` && \
cd .. && \
rm -rf /opt/riscv-gnu-toolchain && \
echo "[success]"

