# Linux PAM HTTP Basic Access Authentication Tests

## Clone

```
git clone --recurse-submodules https://github.com/KebabVPN/linux-pam-baa-ss-test.git

cd linux-pam-baa-ss-test

docker build server/pam-baa -t linux-pam-baa

docker-compose build
```

## Build & Run

```
#
# run tests and exit
#
XAUTHPAM=baa docker-compose up --remove-orphans --force-recreate

#
# optional modes
#
STOPMODE=manual XAUTHPAM=baa docker-compose up --remove-orphans --force-recreate

# manual stop:
touch share/kill

#
# XAUTHPAM values:
# baa (default, basic auth test)
# login (login, system login credentials test)
# deny (always deny)
#

```

## Update

```
git submodule update --remote --recursive
```

## Re-init submodules

```
git submodule deinit -f .
git submodule update --init --recursive
```
