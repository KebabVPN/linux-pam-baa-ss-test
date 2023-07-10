#!/bin/bash

echo "Checking your password. If it doesn't work, script will wait for a few seconds, don't worry..."

pamtester login $1 authenticate << eof
`echo $2`
eof
