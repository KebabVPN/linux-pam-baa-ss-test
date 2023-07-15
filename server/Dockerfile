FROM linux-pam-baa AS pam-baa

RUN ls -al /usr/lib/pam_baa.so

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm-256color

RUN apt -y update
RUN apt -y install strongswan strongswan-pki libstrongswan-extra-plugins libcharon-extra-plugins libcharon-extauth-plugins libtss2-tcti-tabrmd0
RUN apt -y install vim curl pamtester inetutils-ping traceroute binutils
RUN apt -y install rsyslog

COPY --from=pam-baa /usr/lib/pam_baa.so /usr/lib/pam_baa.so

WORKDIR /pam-baa

RUN mkdir /baa
WORKDIR /baa
