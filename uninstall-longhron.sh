#!/bin/bash

set -e

echo "WARNING: This will uninstall Longhorn and delete all volumes, replicas, and configurations!"
read -p "Are you sure you want to continue? (yes/[no]): " CONFIRM

if [ "$CONFIRM" != "yes" ]; then
  echo "Uninstall cancelled."
  exit 1
fi

echo "Step 1: Deleting all Longhorn volumes and replicas..."
kubectl -n longhorn-system delete volumes --all --ignore-not-found
kubectl -n longhorn-system delete replicas --all --ignore-not-found

echo "Step 2: Deleting Longhorn nodes and CRs..."
kubectl -n longhorn-system delete nodes --all --ignore-not-found
kubectl -n longhorn-system delete engines --all --ignore-not-found
kubectl -n longhorn-system delete engineimages --all --ignore-not-found
kubectl -n longhorn-system delete instance-managers --all --ignore-not-found
kubectl -n longhorn-system delete backingimages --all --ignore-not-found
kubectl -n longhorn-system delete backingimagemanagers --all --ignore-not-found
kubectl -n longhorn-system delete settings --all --ignore-not-found

echo "Step 3: Deleting Longhorn ArgoCD Application..."
kubectl -n argocd delete application longhorn --ignore-not-found

echo "Step 4: Deleting the longhorn-system namespace (optional)..."
read -p "Delete the entire longhorn-system namespace as well? (yes/[no]): " DELETE_NS
if [ "$DELETE_NS" == "yes" ]; then
  kubectl delete ns longhorn-system --ignore-not-found
fi

echo "Longhorn uninstall completed."