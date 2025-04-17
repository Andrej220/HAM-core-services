kubectl apply -f applications/storage.yaml -n argocd
kubectl apply -f applications/mongodb.yaml 
kubectl apply -f applications/postgresql.yaml -n argocd
kubectl apply -f applications/db-init.yaml -n argocd