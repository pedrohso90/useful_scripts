#!/bin/bash

MAP='{key1=one, key2=two, key3=three, key4=four}'

MAP=${MAP#?}
MAP=${MAP%?}
MAP=${MAP//,/}

for i in $MAP; do
    IFS='=' read key val <<< $i
    map[$key]=$val
    echo "${map[@]}"
done
