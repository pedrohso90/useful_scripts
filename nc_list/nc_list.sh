#!/bin/bash

port=$1
file="/$HOME/servers.txt"
log="/$HOME/log.txt"

rm -rf $log

while IFS= read -r line; do
    echo "test $line"
    echo "^]^C" | nc -v $line $1 >> $log 2>&1
done < "$file"
