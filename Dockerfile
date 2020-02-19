FROM --platform=$BUILDPLATFORM alpine:edge
ARG BUILDPLATFORM
ARG TARGETARCH

COPY ./dist/$TARGETARCH/rtlamr /usr/bin
COPY ./dist/$TARGETARCH/rtlamr-collect /usr/bin
COPY entrypoint.sh /usr/bin

RUN apk update \
  && apk upgrade \
  && apk add rtl-sdr --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

ENV INFLUX_HOST https://localhost:8086/
ENV INFLUX_DB rtlamr
ENV INFLUX_USER rtlamr
ENV INFLUX_PASS rtlamr
ENV FILTERID 000000000
ENV MSGTYPE all

CMD entrypoint.sh

