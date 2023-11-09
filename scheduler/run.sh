#!/bin/bash

# Check if CLIENT_TOKEN and SERVER_TOKEN environment variables exist.

if [ -z "$CLIENT_TOKEN" ]; then
    echo "CLIENT_TOKEN ENV NOT EXIST"
    exit 1
fi

if [ -z "$SERVER_TOKEN" ]; then
    echo "SERVER_TOKEN ENV NOT EXIST"
    exit 1
fi


echo "Replacing environment variables in the configuration file..."

sed -i "s/CLIENT_TOKEN/$CLIENT_TOKEN/g" scheduler.conf

sed -i "s/SERVER_TOKEN/$SERVER_TOKEN/g" scheduler.conf

echo "Starting scheduler..."
SCCACHE_NO_DAEMON=1 sccache-dist scheduler --config scheduler.conf


