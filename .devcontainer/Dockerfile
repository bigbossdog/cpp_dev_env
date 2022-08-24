FROM --platform=linux/arm64 ubuntu

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        build-essential \
        autoconf \
        libtool \
        pkg-config \
        cmake \
        gdb \
        ninja-build \
        valgrind \
        clang \
        clangd-14 \
        vim \
        git \
        ca-certificates

WORKDIR /workarea
RUN mkdir -p /workarea

RUN git clone --recurse-submodules -b v1.46.3 --depth 1 --shallow-submodules https://github.com/grpc/grpc
RUN cd grpc && \
    mkdir -p cmake/build && \
    cd cmake/build && \
    cmake -DgRPC_INSTALL=ON \
      -DgRPC_BUILD_TESTS=OFF \
      -DCMAKE_INSTALL_PREFIX=$MY_INSTALL_DIR \
      ../.. && \
    make -j 2 && \
    make install && \
    cd ../..