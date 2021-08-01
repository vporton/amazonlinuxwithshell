#!/bin/sh

echo "Initializing..."

# set -e

# TODO: Trap exit and clean /tmp/

test -e /root/.ssh/authorized_keys
key_exists=$?

if test $key_exists != 0 || test "$force_change_root_key" != ""; then
    mkdir -p /root/.ssh
    echo ${root_key} > /root/.ssh/authorized_keys
else
    if test $key_exists != 0 && test "$force_change_root_key" = ""; then
        echo 'Specify environment variable root_key="$(<~/.ssh/id_rsa.pub)"' >&2; exit 1;
    fi
fi

ls /root/.ssh/authorized_keys

exec /usr/sbin/sshd -D
