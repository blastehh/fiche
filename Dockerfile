FROM bitnami/minideb:stretch as build

RUN install_packages curl tar gzip jq gcc make g++ nginx ca-certificates
COPY build.sh build.sh
RUN chmod +x ./build.sh \
    && ./build.sh

FROM bitnami/minideb:stretch

MAINTAINER Blasteh <blasteh@gmail.com>

RUN mkdir -p /var/paste \
    && mkdir -p /var/log/paste

COPY --from=build /usr/local/bin/fiche /usr/local/bin/fiche

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

