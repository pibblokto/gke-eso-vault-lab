#!/usr/bin/env bash

# Usage: ./build-and-push.sh [MY_TAG]
# If MY_TAG is not specified, defaults to "latest"

TAG="${1:-latest}"

IMAGE_REPO="us-central1-docker.pkg.dev/piblokto/hashicorp-vault/vault-reader-http-server"
FULL_IMAGE_NAME="${IMAGE_REPO}:${TAG}"

echo "Building Docker image: ${FULL_IMAGE_NAME}"

# Build the Docker image
docker build -t "${FULL_IMAGE_NAME}" .

echo "Done!"
