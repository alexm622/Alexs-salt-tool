#!/bin/bash

GROUP_SIZE=5
if [ ! -d /tmp/alexs-scripts ]; then
        #make the temp directory
        echo "creating temp directory"
        mkdir /tmp/alexs-scripts/
fi

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 255
fi


##accept all keys
#echo -e "y\r" | salt-key -A > /tmp/alexs-scripts/accepted.tmp
cat /tmp/alexs-scripts/accepted.tmp | grep remi- > /tmp/alexs-scripts/accepted2.tmp
out=$(cat /tmp/alexs-scripts/accepted2.tmp | wc -l)
echo out:$out
remain=$(expr $out % $GROUP_SIZE)
echo remain:$remain
count=$(expr \( $out - $remain \) / $GROUP_SIZE)
echo count:$count
counter=0
rm -r /tmp/alexs-scripts/groups
mkdir /tmp/alexs-scripts/groups
for (( c=1; c<=$count; c++))
do
        group="/tmp/alexs-scripts/groups/group${c}.txt"
        for (( d=1; d<= $GROUP_SIZE; d++ ))
        do
                line=$(expr $d + \( $c - 1 \) "*" $GROUP_SIZE )
                current_minion=$(sed -n "${line}p" < /tmp/alexs-scripts/accepted2.tmp)
                echo $current_minion has been added and is number $line
                echo $current_minion >> $group
        done
done
group=$(expr $count + 1)
group="/tmp/alexs-scripts/groups/group${group}.txt"
for (( d=1; d<= $remain; d++ ))
do
        line=$(expr $d + $count "*" $GROUP_SIZE )
        current_minion=$(sed -n "${line}p" < /tmp/alexs-scripts/accepted2.tmp)
        echo $current_minion has been added and is number $line
        echo $current_minion >> $group
done
