#!/bin/bash
while sleep 2;
do
  read temp < /sys/class/hwmon/hwmon3/temp1_input # change to your temperature sensor
  #echo $temp
  if [ $temp \< 40000 ]; # min temp
    then /usr/bin/i8kfan - 0 > /dev/null
  elif
    [ $temp \< 45000 ]; # max temp
      then /usr/bin/i8kfan - 1 > /dev/null
  else
    /usr/bin/i8kfan - 2 > /dev/null
  fi
done
