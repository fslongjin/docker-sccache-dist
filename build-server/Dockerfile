ARG BASE_IMAGE_NAME

FROM ${BASE_IMAGE_NAME}


WORKDIR /app

ADD build-server.conf /app/build-server.conf

# 默认使用 10G 的缓存
ENV TOOLCHAIN_CACHE_SIZE=10737418240

ADD run.sh /app/run.sh

RUN chmod +x /app/run.sh

CMD [ "/app/run.sh" ]
