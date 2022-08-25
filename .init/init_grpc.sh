#!/bin/bash
cd /workarea

echo 'Cloning gRPC...Outputting to .grpc.out'

# if no existing grpc path:
git clone --recurse-submodules -b v1.46.3 --depth 1 --shallow-submodules https://github.com/grpc/grpc 2>&1 >.grpc.out &

cd grpc
mkdir -p cmake/build
pushd cmake/build
cmake -DgRPC_INSTALL=ON \
      -DgRPC_BUILD_TESTS=OFF \
      -DCMAKE_INSTALL_PREFIX="" \
      ../..
make -j 3
make install
popd