#!/bin/bash

# Define variables
DOCKERHUB_USERNAME="newdevops111"
DOCKER_IMAGE_NAME="newdevops111/devops-automation"
DOCKER_IMAGE_TAG="latest"
DOCKERHUB_PASSWORD="dockerhubpwd"


# Build Docker image
docker build -t "$DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG" .

# Log in to Docker Hub
echo "$DOCKERHUB_PASSWORD" | docker login -u "$DOCKERHUB_USERNAME" --password-stdin

# Push Docker image to Docker Hub
docker push "$DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG"
