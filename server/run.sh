#!/bin/bash

SHARE_DIR=/baa/share

SERVER_FLAG_FILE=$SHARE_DIR/server_setup_complete
CLIENT_FLAG_FILE=$SHARE_DIR/client_setup_complete

rm -f $SERVER_FLAG_FILE
rm -f $CLIENT_FLAG_FILE

t='./utils/run_test.sh'

source "_run-$1.sh"

touch $SERVER_FLAG_FILE

until [ -f $CLIENT_FLAG_FILE ]
do
	sleep 1
done

$t echo "Finished"
exit
