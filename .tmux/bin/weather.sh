#! /bin/bash
WEATHER=$(curl -s http://weather.livedoor.com/forecast/webservice/json/v1\?city\=250010 | jq -r '.forecasts[] | select(.dateLabel == "今日").telop')
case $WEATHER in
    曇時々晴) WE="☁ /☀";;
    曇時々雨) WE="☁ /☂";;
    曇時々雪) WE="☁ /☃";;
    晴時々曇) WE="☀ /☁";;
    晴時々雨) WE="☀ /☂";;
    雨時々曇) WE="☂ /☁";;
    晴のち曇) WE="☀ ->☁";;
    晴のち雨) WE="☀ ->☂";;
    曇のち晴) WE="☁ ->☀";;
    曇のち雨) WE="☁ ->☂";;
    雨のち晴) WE="☂ ->☀";;
    雨のち曇) WE="☂ ->☁";;
    雪のち曇) WE="☃ ->☁";;
    曇のち雪) WE="☁ ->☃";; 
    雨) WE="☂";;
    晴れ) WE="☀";;
    曇り) WE="☁";;
    雪) WE="☃";;
    *) WE="♡";;
    esac
    echo $WE
