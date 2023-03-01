FROM alpine:3.16

ARG AVAHI_VERSION=0.8
ARG AVAHI_RELEASE=r6
ARG BUILD_DATE
ARG VCS_REF

LABEL maintainer elaina.claus@chtm.me

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.license="MIT" \
      org.label-schema.name="Docker Avahi" \
      org.label-schema.url="https://git.chtm.us/nivirx/docker-avahi/" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://git.chtm.us/solidnerd/docker-avahi.git" \
      org.label-schema.vcs-type="Git"

RUN apk --no-cache --no-progress upgrade

RUN apk --no-cache  --no-progress add avahi avahi-tools tini

ENTRYPOINT ["/sbin/tini", "--", "/usr/sbin/avahi-daemon"]
