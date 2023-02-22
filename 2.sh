#!/bin/bash

# Define variables
CLUSTER_NAME="kaiburnode"
REGION="us-east-1"
IMAGE_NAME="hub.docker.com/devopsmohan/kaiburnodejs:39"

# Create the EKS cluster
#eksctl create cluster --name $CLUSTER_NAME --region $REGION
eksctl create cluster --name  $CLUSTER_NAME --version 1.21 --region $REGION --zones=us-east-1a,us-east-1b
#eksctl create cluster --name kaiburnode --region us-east-1 --zones=us-east-1a,us-east-1b



# Deploy the Docker image to the cluster
kubectl run $IMAGE_NAME --image=myregistry.com/myimage:v1 --port=80
kubectl expose deployment $IMAGE_NAME --type=LoadBalancer --port=80 --target-port=80
