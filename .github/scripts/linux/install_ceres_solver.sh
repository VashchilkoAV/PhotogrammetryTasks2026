#!/bin/bash
set -euo pipefail

apt update
apt install -y libunwind-dev libgoogle-glog-dev libgflags-dev libatlas-base-dev libeigen3-dev libsuitesparse-dev

wget https://github.com/ceres-solver/ceres-solver/archive/2.2.0.zip
unzip 2.2.0.zip
cd ceres-solver-2.2.0
mkdir -p build1 && cd build1
cmake -DCMAKE_INSTALL_PREFIX=/opt/ceres-solver220 -DUSE_CUDA=OFF ..
make -j$(nproc)
make install
