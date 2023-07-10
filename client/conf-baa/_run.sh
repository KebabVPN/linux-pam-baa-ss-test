#!/bin/bash

$t ./tools/start_service.sh           rsyslog

$t cp $SHARE_DIR/ca-cert.pem /etc/ipsec.d/cacerts/ca-cert.pem

$t ping -c 1 server.kebabvpn.domain

$t ./tools/start_service.sh           ipsec
$t ./tools/test_command_5s.sh         ipsec status

$t ./tools/check_port_opened.sh       4500 charon 2
$t ./tools/check_port_opened.sh       500 charon 2

$t "ipsec status | grep ESTABLISHED | grep server.kebabvpn.domain"
