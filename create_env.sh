#!/bin/bash

# Load .env file
source .env

# Get environment variables
CONTAINER_FOLDER=$CONTAINER_FOLDER
CONTAINER_NAME=$CONTAINER_NAME
FONT=$FONT
FONT_SIZE=$FONT_SIZE
COLOR_THEME=$COLOR_THEME

# Replace placeholders in devcontainer template
sed -e "s/__CONTAINER_FOLDER__/${CONTAINER_FOLDER}/g" \
    -e "s/__CONTAINER_NAME__/${CONTAINER_NAME}/g" \
    -e "s/__FONT__/${FONT}/g" \
    -e "s/__FONT_SIZE__/${FONT_SIZE}/g" \
    -e "s/__COLOR_THEME__/${COLOR_THEME}/g" \
    .devcontainer/devcontainer.json.template > .devcontainer/devcontainer.json


# Replace placeholders in docker compose template
sed -e "s/__CONTAINER_FOLDER__/${CONTAINER_FOLDER}/g" \
    -e "s/__CONTAINER_NAME__/${CONTAINER_NAME}/g" \
    .dev_environment/docker-compose.yml.template > .dev_environment/docker-compose.yml


# Replace placeholders in dockerfile template
sed -e "s/__CONTAINER_NAME__/${CONTAINER_NAME}/g" \
    .dev_environment/Dockerfile.template > .dev_environment/Dockerfile