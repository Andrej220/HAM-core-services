.PHONY: all longhorn-disks backup-targetsclean-all clean-volumes clean-longhorn-disks clean-backup-targets

install-all: longhorn-disks backup-targets

clean-all: clean-backup-targets clean-volumes clean-longhorn-disks

longhorn-disks:
	kubectl apply -f manifests-for-manual-application/docserver.yaml
	kubectl apply -f manifests-for-manual-application/ds-node1.yaml
	kubectl apply -f manifests-for-manual-application/ds-node3.yaml
	kubectl apply -f manifests-for-manual-application/longhorn-r0.yaml
	kubectl apply -f manifests-for-manual-application/longhorn-r10.yaml

backup-targets:
	kubectl apply -f manifests-for-manual-application/nfs-server.yaml
	kubectl apply -f manifests-for-manual-application/nfs-svc.yaml
	kubectl apply -f manifests-for-manual-application/default-backup-pvc.yaml
	kubectl apply -f manifests-for-manual-application/backup-target.yaml

clean-volumes:
	kubectl -n longhorn-system delete volume --all --ignore-not-found
	kubectl -n longhorn-system delete replicas --all --ignore-not-found

clean-longhorn-disks:
	kubectl delete -f manifests-for-manual-application/docserver.yaml --ignore-not-found
	kubectl delete -f manifests-for-manual-application/ds-node1.yaml --ignore-not-found
	kubectl delete -f manifests-for-manual-application/ds-node3.yaml --ignore-not-found
	kubectl delete -f manifests-for-manual-application/longhorn-r0.yaml --ignore-not-found
	kubectl delete -f manifests-for-manual-application/longhorn-r10.yaml --ignore-not-found

clean-backup-targets:
	kubectl delete -f manifests-for-manual-application/backup-target.yaml --ignore-not-found
	kubectl delete -f manifests-for-manual-application/default-backup-pvc.yaml --ignore-not-found
	kubectl delete -f manifests-for-manual-application/nfs-svc.yaml --ignore-not-found
	kubectl delete -f manifests-for-manual-application/nfs-server.yaml --ignore-not-found