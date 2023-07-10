#!/bin/bash

pki --gen \
    --type rsa \
    --size 4096 \
    --outform pem \
    > /etc/ipsec.d/private/ca-key.pem && \

pki --self \
    --ca \
    --lifetime 3650 \
    --in /etc/ipsec.d/private/ca-key.pem \
    --type rsa \
    --dn "CN=TasteVPN root CA" \
    --outform pem \
    > /etc/ipsec.d/cacerts/ca-cert.pem && \

pki --gen \
    --type rsa \
    --size 4096 \
    --outform pem \
    > /etc/ipsec.d/private/server-key.pem && \

pki --pub \
    --in /etc/ipsec.d/private/server-key.pem \
    --type rsa | \

pki --issue \
    --lifetime 1825 \
    --cacert /etc/ipsec.d/cacerts/ca-cert.pem \
    --cakey /etc/ipsec.d/private/ca-key.pem \
    --dn "CN=server.tastevpn.domain" \
    --san server.tastevpn.domain \
    --flag serverAuth \
    --flag ikeIntermediate \
    --outform pem \
    > /etc/ipsec.d/certs/server-cert.pem && \

sysctl -w net.ipv4.ip_forward=1 && \
sysctl -w net.ipv4.ip_no_pmtu_disc=1
