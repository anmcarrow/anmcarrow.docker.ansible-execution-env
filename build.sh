#!/bin/bash

source .envs

PROJECT_NAME="anmcarrow"
IMAGE_NAME="ansible:openstack-features"

time docker build -t "${PROJECT_NAME}"/"${IMAGE_NAME}" \
--build-arg PRIVRSA="${PRIVRSA}" \
--build-arg PUBRSA="${PUBRSA}" \
.

docker push "${PROJECT_NAME}"/"${IMAGE_NAME}"

exit 0
