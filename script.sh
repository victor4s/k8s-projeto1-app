#!/bin/bash

echo -e "\nCriando imagens docker...\n"
docker build -t victor4s/k8s-projeto-backend:1.0 backend/
docker build -t victor4s/k8s-projeto-database:1.0 database/

echo -e "\nRealizando o push das imagens...\n"
docker push victor4s/k8s-projeto-backend:1.0
docker push victor4s/k8s-projeto-database:1.0

echo -e "\nCriando serviços e realizado deploy on cluster Kubernetes...\n"
kubectl apply -f ./services.yml
kubectl apply -f ./deployment.yml