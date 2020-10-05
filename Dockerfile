FROM 0x01be/gradle:5.4.1

RUN apk add --no-cache --virtual zap-build-dependencies \
    git

ENV ZAP_REVISION master
RUN git clone --depth 1 --branch ${ZAP_REVISION} https://github.com/zaproxy/zaproxy.git /zap

WORKDIR /zap

RUN gradle :zap:distLinux

