#!/bin/bash
#while read p; do
  #salt $p state.apply scripts.freshload -t600&
#done <salt.txt

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 255
fi

if [ ! -d /tmp/alexs-scripts/misc ]; then
        #make the misc directory
        echo "creating misc directory"
        mkdir /tmp/alexs-scripts/misc/
fi

ls -1a -A /tmp/alexs-scripts/groups > /tmp/alexs-scripts/misc/dir.tmp

count=0
while read f; do
    count=expr count + 1
    echo "starting batch ${count}"
    echo $f
    pa="/tmp/alexs-scripts/groups/${f}"
    echo reading from path $pa
    while read p; do
        echo "sent command to $p"
        #salt $p state.apply scripts.freshload -t600&
    done < $pa
    echo "sleeping for 5 minutes to let everything in batch ${count} finish"
    sleep 5m
done < /tmp/alexs-scripts/misc/dir.tmp