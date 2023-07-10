FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm-256color

RUN apt-get -yq update
RUN apt-get -yq install strongswan strongswan-pki libstrongswan-extra-plugins libcharon-extra-plugins libcharon-extauth-plugins libtss2-tcti-tabrmd0
RUN apt-get -yq install vim curl pamtester inetutils-ping traceroute binutils
RUN apt-get -yq install rsyslog

RUN apt-get -yq install --no-install-suggests --no-install-recommends autoconf automake autopoint bison bzip2 docbook5-xml docbook-xsl-ns flex gettext libaudit-dev libdb-dev libfl-dev libselinux1-dev libssl-dev libtool libxml2-utils make pkg-config sed w3m xsltproc xz-utils

WORKDIR /pam-baa
RUN mkdir src
COPY ./pam-baa/Makefile ./
COPY ./pam-baa/src/vendor ./src/vendor
RUN make libpam

RUN mkdir bin
COPY ./pam-baa/src/baa ./src/baa
RUN make
RUN cp ./bin/pam_baa.so /usr/lib/pam_baa.so

RUN mkdir /baa
WORKDIR /baa
