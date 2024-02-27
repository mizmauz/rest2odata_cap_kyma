#!/usr/bin/env bash

cds build #Generate cds files in /gen/
mkdir -p ./gen/srv/db/data # copy db/data to have initial data
cp ./db/data/*.csv ./gen/srv/db/data

docker build -f ./docker/Dockerfile -t mizmauzdocker/odatafiori:0.0.1 .

docker login -u <your username> -p <your password> # !! Enter your own user here
docker push mizmauzdocker/odatafiori:0.0.1

export KUBECONFIG="$HOME/.kube/config"
kubectl delete deployment odatafiori | true
kubectl apply -f ./k8s/
