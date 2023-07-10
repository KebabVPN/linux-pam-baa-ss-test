#!/bin/bash

SHARE_DIR=/baa/share

SERVER_FLAG_FILE=$SHARE_DIR/server_setup_complete
CLIENT_FLAG_FILE=$SHARE_DIR/client_setup_complete
KILL_FLAG_FILE=$SHARE_DIR/kill

rm -f $SERVER_FLAG_FILE
rm -f $CLIENT_FLAG_FILE
rm -f $KILL_FLAG_FILE

until [ -f $SERVER_FLAG_FILE ]
do
	sleep 1
done

t='./utils/run_test.sh'

source "_run-$1.sh"

if [ "$STOPMODE" == "manual" ]; then
until [ -f $KILL_FLAG_FILE ]
do
	sleep 1
done
fi

touch $CLIENT_FLAG_FILE
$t echo "Finished"
exit