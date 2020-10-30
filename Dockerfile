FROM 0x01be/zap:build as build

FROM 0x01be/xpra

RUN apk add --no-cache --virtual zap-runtime-dependencies \
    openjdk8-jre \
    firefox-esr \
    bash

COPY --from=build /opt/zap/ /opt/zap/

USER xpra
ENV PATH ${PATH}:/opt/zap/
ENV COMMAND zap.sh

