FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm-256color

RUN apt -y update
RUN apt -y install strongswan strongswan-pki libstrongswan-extra-plugins libcharon-extra-plugins libcharon-extauth-plugins libtss2-tcti-tabrmd0
RUN apt -y install vim curl pamtester inetutils-ping traceroute binutils
RUN apt -y install rsyslog

RUN mkdir /baa
WORKDIR /baa
