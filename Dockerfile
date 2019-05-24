FROM ubuntu:xenial

ENV ANSIBLE_VERSION 2.8.0

RUN apt-get update && \
    apt-get install -y python3-pip && \
    pip3 install --upgrade pip && \
    pip install pyOpenSSL && \
    pip install ansible==${ANSIBLE_VERSION} && \
    pip install docker && \
    apt-get clean

ENV ANSIBLE_HOST_KEY_CHECKING false
ENV ANSIBLE_RETRY_FILES_ENABLED false
ENV ANSIBLE_SSH_PIPELINING true
ENV DOCKER_HOST="tcp://127.0.0.1:2376"

WORKDIR /ansible

CMD tail -f /dev/null
ENTRYPOINT sh -c

