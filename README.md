# kubernetes-mongodb
Working mongodb replica sets with kubernetes and MiniKube.
If you want this to work properly on GKE just change the storage class portion.


You'll need a secret for your mongodb key if you don't have one already: `bash generate-secret.sh`

```
bash generate-secret.sh
kubectl apply -f headless-service.yml
kubectl apply -f mongoDB.yaml
bash configure_repset_auth.sh
```

This will create a mongodb replica set across three nodes with an admin account that has credentials you define with environment variables.
