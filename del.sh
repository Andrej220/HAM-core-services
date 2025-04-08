kubectl delete -f applications/storage.yaml -n argocd
kubectl delete -f applications/postgresql.yaml -n argocd
kubectl delete -f applications/mongodb.yaml -n argocd
kubectl delete -f applications/db-init.yaml -n argocd
kubectl delete secret --all -n database-test