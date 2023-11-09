SCCACHE_VERSION=v0.5.4
DIST_FILE_NAME=sccache-dist-${SCCACHE_VERSION}-x86_64-unknown-linux-musl
CLIENT_FILE_NAME=sccache-${SCCACHE_VERSION}-x86_64-unknown-linux-musl
GITHUB_URL=https://ghproxy.com/https://github.com/mozilla/sccache/releases/download/${SCCACHE_VERSION}/

mkdir -p bin

echo "Downloading sccache..."

# If the file already exists, it will not be downloaded again.
if [ ! -f $DIST_FILE_NAME.tar.gz ]; then
    wget  ${GITHUB_URL}${DIST_FILE_NAME}.tar.gz || exit 1
    tar -zxvf $DIST_FILE_NAME.tar.gz || exit 1
    mv $DIST_FILE_NAME/sccache-dist ./bin || exit 1
fi

if [ ! -f $CLIENT_FILE_NAME.tar.gz ]; then
    wget  ${GITHUB_URL}${CLIENT_FILE_NAME}.tar.gz || exit 1
    tar -zxvf $CLIENT_FILE_NAME.tar.gz || exit 1

    mv $CLIENT_FILE_NAME/sccache ./bin || exit 1
fi
