#!/usr/bin/env bash

set -ex
set -o pipefail

TAG=${TAG:-v3.2.0}
REPO=${REPO:-registry.gitlab.com/sonaproject/s2i-python}

# support other container tools. e.g. podman
CONTAINER_CLI=${CONTAINER_CLI:-docker}
CONTAINER_BUILDER=${CONTAINER_BUILDER:-"buildx build"}

# supported platforms
PLATFORMS=linux/amd64,linux/arm64

# shellcheck disable=SC2086 # inteneded splitting of CONTAINER_BUILDER
${CONTAINER_CLI} ${CONTAINER_BUILDER} \
  --platform ${PLATFORMS} \
  --push \
  -f 3.9/Dockerfile.rhel8 \
  -t "${REPO}"/python-39-rhel8:"${TAG}" .

