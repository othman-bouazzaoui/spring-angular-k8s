#!/bin/bash

## start reading the args
for arg in "$@"; do
  case $arg in
    TAG=*)  TAG="${arg#*=}" ;;
    PUSH=*) PUSH="${arg#*=}" ;;
  esac
done
TAG="${TAG:-1.0}"
PUSH="${PUSH:-false}"
## end reading the args

echo "  TAG  : ${TAG}"
echo "  PUSH : ${PUSH}"

backend="api-spring"
ihm="ihm-angular"

# Build Docker image
echo "Building backend Docker image..."
docker buildx build -t othmanbouazzaoui/${backend}:${TAG} ./api

# Build Docker image
echo "Building frontend Docker image..."
docker buildx build -t othmanbouazzaoui/${ihm}:${TAG} ./ihm

echo "Docker images built successfully!"

if [[ "${PUSH}" == "true" ]]; then

# Push Docker image
echo "Pushing backend Docker image ..."
docker push othmanbouazzaoui/${backend}:${TAG}

# Push Docker image
echo "Pushing ihm docker image..."
docker push othmanbouazzaoui/${ihm}:${TAG}

echo "Docker images pushed successfully!"

fi
