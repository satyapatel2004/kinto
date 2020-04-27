#!/bin/bash
# >/dev/null 2>&1
/usr/local/bin/xkeysnail --quiet --watch "$1" &

inotifywait -m -e close_write,moved_to,create,modify /tmp/kinto/xkeysnail |
while read -r path; do
	/usr/bin/killall xkeysnail
	/usr/local/bin/xkeysnail --quiet --watch "$1" &
done