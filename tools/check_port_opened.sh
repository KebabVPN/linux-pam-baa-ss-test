#!/bin/bash

COUNT=$(ss -anutp | grep :$1 | grep $2 | wc -l)

if [[ COUNT -eq $3 ]]
then
  exit 0
else
  exit 1
fi

