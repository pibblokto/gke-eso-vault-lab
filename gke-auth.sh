#!/usr/bin/env bash

# Show help if -h is supplied
if [[ "$1" == "-h" ]]; then
  echo "Usage: $0 CLUSTER_NAME COMPUTE_ZONE PROJECT_ID"
  echo
  echo "Example:"
  echo "  $0 primary-sandbox-cluster us-central1-c piblokto"
  exit 0
fi

# Verify that all three parameters are present
if [[ $# -lt 3 ]]; then
  echo "Error: Missing parameters."
  echo "Usage: $0 CLUSTER_NAME COMPUTE_ZONE PROJECT_ID"
  exit 1
fi

CLUSTER_NAME="$1"
COMPUTE_ZONE="$2"
PROJECT_ID="$3"

# Update kubeconfig for GKE
gcloud container clusters get-credentials "$CLUSTER_NAME" \
  --zone "$COMPUTE_ZONE" \
  --project "$PROJECT_ID"
