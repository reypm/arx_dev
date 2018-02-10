#!/bin/bash
set -e

# Check if the ENV variable has been defined otherwise fallback on
# a default value. This value belongs to the first user created on
# the system
if [ "$UID" == 0 ]; then
    uid=1000;
else
    uid=${UID};
fi

if [ -z "${GID}" ]; then
    gid=1000;
else
    gid=${GID};
fi

echo "UID: $uid"
echo "GID: $gid"

# Apache gets grumpy about PID files pre-existing
rm -f /var/run/apache2/apache2.pid

exec httpd -DFOREGROUND "$@"