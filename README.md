# Linux PAM HTTP Basic Access Authentication Tests

## Build & Run

```
#
# run tests and exit
#
XAUTHPAM=login docker-compose up --remove-orphans --force-recreate

#
# optional mode to keep containers up and running
#
STOPMODE=manual XAUTHPAM=login docker-compose up --remove-orphans --force-recreate

#
# manual stop
#
touch share/kill
```
