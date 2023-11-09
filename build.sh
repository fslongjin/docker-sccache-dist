source ./config.sh


# Build base image

echo "Building base image..."
cd base

echo "Downloading bin files"

# cd binfiles && bash download.sh && cd .. || exit 1

docker build -t $BASE_IMAGE_NAME . || exit 1

cd ..

# Build scheduler image

echo "Building scheduler image..."
cd scheduler
docker build --build-arg BASE_IMAGE_NAME=$BASE_IMAGE_NAME -t $SCHEDULER_IMAGE_NAME . || exit 1
cd ..

# 构建 build-server 镜像
cd build-server
docker build --build-arg BASE_IMAGE_NAME=$BASE_IMAGE_NAME -t $BUILD_SERVER_IMAGE_NAME . || exit 1
cd ..
