#!/bin/bash

LINES=$(cat /$HOME/servers.txt | wc -l)
HOOK="https://hooks.slack.com/xyz/xyz/xyz/xyz"

channel="{channel1=slack_1, channel2=slack_2}"
channel=${channel#?}
channel=${channel%?}
channel=${channel//,/}

for i in $channel; do
    IFS='=' read key val <<< $i
    channel[$key]=$val
    text="$LINES linhas no arquivo"
    escapedText="$(echo $text | sed 's/"/\"/g' | sed "s/'/\'/g" )"
    json="{\"channel\": \"#$channel\", \"text\": \"$escapedText\"}"
    curl -s -d "payload=$json" $HOOK
done
