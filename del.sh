kubectl delete -f applications/storage.yaml -n argocd
kubectl delete -f applications/postgresql.yaml 
kubectl delete -f applications/mongodb.yaml 
kubectl delete -f applications/db-init.yaml -n argocd
kubectl delete secret --all -n database
kubectl delete all --all  -n database
kubectl delete pvc --all -n database
kubectl delete pv pv-raid10-postgresql
kubectl delete pv pv-raid10-mongodb
kubectl get all  -n database