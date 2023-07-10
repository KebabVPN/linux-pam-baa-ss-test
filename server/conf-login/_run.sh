#!/bin/bash

$t ./tools/setup_ipsec.sh

$t ./tools/user_add.sh                linuxuser linuxpass
$t ./tools/user_authenticate_login.sh linuxuser linuxpass

$t ./tools/start_service.sh           rsyslog

$t ./tools/start_service.sh           ipsec
$t ./tools/test_command_5s.sh         ipsec status

$t ./tools/check_port_opened.sh       4500 charon 2
$t ./tools/check_port_opened.sh       500 charon 2

$t cp /etc/ipsec.d/cacerts/ca-cert.pem $SHARE_DIR/ca-cert.pem
