#!/bin/bash

MAP="( [key1]=one [key2]=two [key3]=three [key4]=four )"

declare -A map="$MAP"

echo "${map[key1]}"
