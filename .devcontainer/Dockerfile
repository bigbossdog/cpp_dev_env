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
