#!/bin/bash

useradd $1

ret=$?
if [[ ret -eq 0 ]]
then
  echo "$1:$2" | chpasswd
else
  exit $ret
fi

