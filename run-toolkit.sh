#!/bin/bash

docker run --rm -it \
  --name terraform-deployer \
  -v "$(pwd):/app" \
  -w /app \
  terraform-deployer
