#!/usr/bin/env bash

# Set up Application Default Credentials
echo "Gcloud "
gcloud auth login
export GOOGLE_OAUTH_ACCESS_TOKEN=$(gcloud auth print-access-token)