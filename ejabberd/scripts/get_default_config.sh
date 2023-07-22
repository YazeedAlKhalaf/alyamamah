#!/bin/bash

# Name of the temporary container
TMP_CONTAINER="tmp-ejabberd"

# Directory to save the default configuration
SAVE_DIR="./conf"

# Check if the directory exists and remove it
if [ -d "$SAVE_DIR" ]; then
    echo "Removing existing conf directory..."
    rm -rf $SAVE_DIR
fi

# Run a temporary ejabberd container
docker run -d --name $TMP_CONTAINER ghcr.io/processone/ejabberd:23.04

# Wait for the container to initialize
while ! docker logs $TMP_CONTAINER 2>&1 | grep -q "is started in the node ejabberd@localhost"; do
    echo "Waiting for ejabberd to start..."
    sleep 1
done

# Copy the configuration files from the container to the host
docker cp $TMP_CONTAINER:/opt/ejabberd/conf/. $SAVE_DIR/

# Stop and remove the temporary container
docker rm -f $TMP_CONTAINER

echo "Default configuration has been copied to $SAVE_DIR"
