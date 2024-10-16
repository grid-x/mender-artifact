# Keep using Debian Bullseye OS for OpenSSL 1.1 compatibility. See QA-507
FROM golang:1.23.1-bullseye as builder
RUN mkdir -p /go/src/github.com/grid-x/mender-artifact
WORKDIR /go/src/github.com/grid-x/mender-artifact
ADD ./ .
RUN make get-build-deps && \
    make build && \
    make install
ENTRYPOINT [ "/go/bin/mender-artifact" ]
