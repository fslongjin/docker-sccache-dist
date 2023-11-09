#!/bin/bash

# Check if SCHEDULER_URL, BUILD_SERVER_PUBLIC_IP 和 SERVER_TOKEN env exist

if [ -z "$SCHEDULER_URL" ]; then
    echo "SCHEDULER_URL ENV NOT EXIST"
    exit 1
fi

if [ -z "$SERVER_TOKEN" ]; then
    echo "SERVER_TOKEN ENV NOT EXIST"
    exit 1
fi

if [ -z "$BUILD_SERVER_PUBLIC_IP" ]; then
    echo "BUILD_SERVER_PUBLIC_IP ENV NOT EXIST"
    exit 1
fi


if [ -z "$BUILD_SERVER_PUBLIC_PORT" ]; then
    echo "BUILD_SERVER_PUBLIC_PORT ENV NOT EXIST"
    exit 1
fi

if [ -z "$TOOLCHAIN_CACHE_SIZE" ]; then
    echo "TOOLCHAIN_CACHE_SIZE ENV NOT EXIST"
    exit 1
fi



echo "Replacing environment variables in the configuration file..."

sed -i "s#SCHEDULER_URL#$SCHEDULER_URL#g" build-server.conf

sed -i "s/SERVER_TOKEN/$SERVER_TOKEN/g" build-server.conf
sed -i "s/TOOLCHAIN_CACHE_SIZE/$TOOLCHAIN_CACHE_SIZE/g" build-server.conf
sed -i "s/BUILD_SERVER_PUBLIC_IP/$BUILD_SERVER_PUBLIC_IP/g" build-server.conf
sed -i "s/BUILD_SERVER_PUBLIC_PORT/$BUILD_SERVER_PUBLIC_PORT/g" build-server.conf

cat build-server.conf
echo "Starting build-server..."
SCCACHE_NO_DAEMON=1 sccache-dist server --config build-server.conf
