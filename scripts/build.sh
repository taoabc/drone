#!/bin/sh

echo "building docker images for ${GOOS}/${GOARCH} ..."

REPO="github.com/drone/drone"

# compile the server using the cgo
go build -tags "oss nolimit" -ldflags "-extldflags \"-static\"" -o release/linux/${GOARCH}/drone-server ${REPO}/cmd/drone-server

# compile the runners with gcc disabled
export CGO_ENABLED=0 # 上一个步骤可能导致一个失败，使用这个语句来解决失败问题
# go build -o release/linux/${GOARCH}/drone-agent      ${REPO}/cmd/drone-agent
# go build -o release/linux/${GOARCH}/drone-controller ${REPO}/cmd/drone-controller