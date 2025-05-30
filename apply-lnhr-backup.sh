#!/bin/bash

echo "Applying Longhorn node and disk configs..."
kubectl apply -f manifests-for-manual-application/docserver.yaml
kubectl apply -f manifests-for-manual-application/ds-node1.yaml
kubectl apply -f manifests-for-manual-application/ds-node3.yaml
kubectl apply -f manifests-for-manual-application/longhorn-r0.yaml
kubectl apply -f manifests-for-manual-application/longhorn-r10.yaml

echo "Applying NFS and backup target manifests..."
kubectl apply -f manifests-for-manual-application/nfs-server.yaml
kubectl apply -f manifests-for-manual-application/nfs-svc.yaml
kubectl apply -f manifests-for-manual-application/default-backup-pvc.yaml
kubectl apply -f manifests-for-manual-application/backup-target.yaml

echo 'All done!'