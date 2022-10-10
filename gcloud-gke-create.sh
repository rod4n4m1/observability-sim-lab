#!/bin/bash


gcloud auth login

# K8s - configure kubectl for my GKE cluster
# gcloud container clusters get-credentials cluster-1 --zone <zone_id> --project <project_id>

gcloud container clusters create cluster-1 --no-enable-autoupgrade --enable-service-externalips --enable-kubernetes-alpha --region=southamerica-east1-a --cluster-version=1.23.9-gke.900 --machine-type=e2-standard-2 --monitoring=NONE

# enable node pool autoscaling
# gcloud container clusters update cluster-1 --enable-autoscaling \
# --node-pool=default-pool \
# --min-nodes=3 --max-nodes=5 --region=<zone_id>

gcloud compute firewall-rules create obssim-node-ports --allow tcp:32000,tcp:30090,tcp:30093
