# gke-eso-vault-lab
Lab for practive with external-secrets operator and 

- Run either run-toolkit.sh or run-toolkit.ps1 to start toolkit container
- Then run **source ./gcloud-auth.sh**
- Then run **./gke-auth.sh CLUSTER_NAME COMPUTE_ZONE PROJECT_ID**
- You are good to go with **terraform init** under any of the deployments in deployments/ directory
