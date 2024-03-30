#!/bin/bash

# Run the fabric setup command
yes '' | head -n 3 | fabric --setup

# Run the main command
if [ -z "$1" ]; then
    # Default command
    exec fabric -h
else
    # Run the main command
    exec "$@"
fi