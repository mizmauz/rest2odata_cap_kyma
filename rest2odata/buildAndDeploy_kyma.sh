#!/usr/bin/env bash

cds build #Generate cds files in /gen/

docker build -f ./docker/Dockerfile -t mizmauzdocker/rest2odata:0.0.1 .

docker login -u mizmauzdocker -p 1602Emil! # !! Enter your own user here
docker push mizmauzdocker/rest2odata:0.0.1

export KUBECONFIG="$HOME/.kube/config"
kubectl delete deployment rest2odata | true
kubectl apply -f ./k8s/rest2odata.yaml