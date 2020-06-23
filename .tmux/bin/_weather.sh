#! /bin/bash

if !(type "weather" > /dev/null 2>&1); then
    # 対象のコマンドをインストールするような処理
   sudo apt install weather-util
fi

WEATHER=`weather rjbd `
echo "$WEATHER" >> weather.txt
WEATHER=`sed '1,2d' weather.txt`
echo "${WEATHER#*:}" >> weather3.txt
TEMP=`head -n 1 weather3.txt | tail -n 1`
TEMP=`echo "${TEMP#*(}"`
echo -n "${TEMP%*)}"
echo -n " "
SKY=`head -n 4 weather3.txt | tail -n 1`
SKY=`echo "${SKY#*:}"`
echo $SKY
rm weather.txt
#rm weather2.txt
rm weather3.txt
