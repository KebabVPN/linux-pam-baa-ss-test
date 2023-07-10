#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
MAGENTA=$(tput setaf 5)
NORMAL=$(tput sgr0)

printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "> ${MAGENTA}$@${NORMAL}"

eval "$@"

ret=$?

if [[ ret -eq 0 ]]
then
  echo "> ${GREEN}PASS${NORMAL}"
else
  echo "> ${RED}ERROR${NORMAL}"
fi
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -

exit $ret
