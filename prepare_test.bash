#!/bin/bash
echo "cleaning up"
rm -r /tmo/alexs-scripts

if [ ! -d /tmp/alexs-scripts ]; then
        #make the temp directory
        echo "creating temp directory"
        mkdir /tmp/alexs-scripts/
fi

if [ ! -d /tmp/alexs-scripts/misc ]; then
        #make the misc directory
        echo "creating misc directory"
        mkdir /tmp/alexs-scripts/misc/
fi

cp test_files/accepted.tmp /tmp/alexs-scripts/
cp test_files/test_in.tmp /tmp/alexs-scripts/
