FROM 0x01be/zap:build as build

FROM 0x01be/xpra

COPY --from=build /opt/zap/ /opt/zap/

USER root

RUN apk add --no-cache --virtual zap-runtime-dependencies \
    openjdk8-jre \
    firefox-esr \
    bash

USER xpra

ENV PATH ${PATH}:/opt/zap/

ENV COMMAND "zap.sh"

