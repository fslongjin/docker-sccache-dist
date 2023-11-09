ARG BASE_IMAGE_NAME

FROM ${BASE_IMAGE_NAME}

WORKDIR /app

ADD scheduler.conf /app/scheduler.conf

ADD run.sh /app/run.sh

RUN chmod +x /app/run.sh

CMD [ "/app/run.sh" ]
