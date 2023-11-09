
source ./config.sh

banner(){
    echo "========================================================"
    echo "1. Create scheduler container"
    echo "2. Create build-server container"
    echo "3. Create scheduler and build-server containers"
    echo "========================================================"
}

create_scheduler(){
    docker run -d --name=${CONTAINER_NAME_PREFIX}scheduler --restart=always \
        -e CLIENT_TOKEN=$CLIENT_TOKEN -e SERVER_TOKEN=$SERVER_TOKEN \
        -p $SCHEDULER_PORT:10600 $SCHEDULER_IMAGE_NAME
}

create_build_server(){
    docker run --privileged=true -d --name=${CONTAINER_NAME_PREFIX}build-server --restart=always \
        -e SCHEDULER_URL=$SCHEDULER_URL -e SERVER_TOKEN=$SERVER_TOKEN -e TOOLCHAIN_CACHE_SIZE=$TOOCHAIN_CACHE_SIZE_BYTES \
        -e BUILD_SERVER_PUBLIC_IP=$BUILD_SERVER_PUBLIC_IP -e BUILD_SERVER_PUBLIC_PORT=$BUILD_SERVER_PUBLIC_PORT \
        --tmpfs /tmp \
        -p $BUILD_SERVER_PUBLIC_PORT:$BUILD_SERVER_PUBLIC_PORT $BUILD_SERVER_IMAGE_NAME
}

banner

read -p "Please enter your choice: " choice


case $choice in
    1)
        create_scheduler
        ;;
    2)
        echo "Create build-server container"
        create_build_server

        ;;
    3)
        echo "Create scheduler and build-server container"
        create_scheduler
        create_build_server
        ;;

    *)
        echo "Invalid input"
        ;;
esac