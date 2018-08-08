#!/bin/bash

source .envs

PROJECT_NAME="anmcarrow"
IMAGE_NAME="ansible"

time docker build -t "${PROJECT_NAME}"/"${IMAGE_NAME}" \
--build-arg PRIVRSA="${PRIVRSA}" \
--build-arg PUBRSA="${PUBRSA}" \
.

docker push anmcarrow/ansible

exit 0
