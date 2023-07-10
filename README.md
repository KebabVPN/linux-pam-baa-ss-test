# Linux PAM HTTP Basic Access Authentication Tests

## Clone

```
git clone --recurse-submodules https://github.com/KebabVPN/linux-pam-baa-ss-test.git
```

## Build & Run

```
#
# run tests and exit
#
XAUTHPAM=login docker-compose up --remove-orphans --force-recreate

XAUTHPAM=baa docker-compose up --remove-orphans --force-recreate

#
# optional mode to keep containers up and running
#
STOPMODE=manual XAUTHPAM=login docker-compose up --remove-orphans --force-recreate

#
# manual stop
#
touch share/kill
```
