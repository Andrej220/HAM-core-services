#!/bin/bash

echo "Deleting backup-related resources..."
kubectl delete -f manifests-for-manual-application/backup-target.yaml --ignore-not-found
kubectl delete -f manifests-for-manual-application/default-backup-pvc.yaml --ignore-not-found
kubectl delete -f manifests-for-manual-application/nfs-svc.yaml --ignore-not-found
kubectl delete -f manifests-for-manual-application/nfs-server.yaml --ignore-not-found

echo "Deleting Longhorn volumes and replicas..."
kubectl -n longhorn-system delete volume --all --ignore-not-found
kubectl -n longhorn-system delete replicas --all --ignore-not-found

echo "Deleting Longhorn disk and node definitions..."
kubectl delete -f manifests-for-manual-application/docserver.yaml --ignore-not-found
kubectl delete -f manifests-for-manual-application/ds-node1.yaml --ignore-not-found
kubectl delete -f manifests-for-manual-application/ds-node3.yaml --ignore-not-found
kubectl delete -f manifests-for-manual-application/longhorn-r0.yaml --ignore-not-found
kubectl delete -f manifests-for-manual-application/longhorn-r10.yaml --ignore-not-found

echo 'Cleanup complete!'