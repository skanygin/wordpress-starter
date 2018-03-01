#!/usr/bin/env bash
set -e

npm_package_version="${npm_package_version?Script must be run using npm}"

#docker login

# NOTE: Not building this stack of images concurrently due to a known issue
# with docker concurrent builds. https://github.com/moby/moby/issues/9656

docker build \
  -t "washdrop/wordpress:latest" \
  -t "washdrop/wordpress:$npm_package_version" \
./src/

echo "

Successfully built images with the following tags:"

docker images washdrop/wordpress --format "{{.Tag}}" | sort -r
