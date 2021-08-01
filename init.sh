#!/bin/bash

echo "Initializing..."

# set -e

trap "echo 'Cleaning temp files...'; systemd-tmpfiles --clean" SIGTERM SIGINT

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

# exec /usr/sbin/sshd -D
/usr/sbin/sshd -D &
pid=$!
echo "SSHD started."
# trap "echo 'Killing'; kill $pid; exit" SIGTERM SIGINT

sleep infinity & wait
echo 'Killing SSHD...'
kill $pid
