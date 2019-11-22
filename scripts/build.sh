#!/bin/sh

echo "building docker images for ${GOOS}/${GOARCH} ..."

REPO="github.com/drone/drone"

# compile the server using the cgo
go build -ldflags -tags "oss nolimit" "-extldflags \"-static\"" -o release/linux/${GOARCH}/drone-server ${REPO}/cmd/drone-server

# compile the runners with gcc disabled
export CGO_ENABLED=0
go build -tags "oss nolimit" -o release/linux/${GOARCH}/drone-agent      ${REPO}/cmd/drone-agent
go build -tags "oss nolimit" -o release/linux/${GOARCH}/drone-controller ${REPO}/cmd/drone-controller
