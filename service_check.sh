#!/bin/bash

service=$1

count=`ps -ef | grep $service | grep -v grep | wc -l`

if [ $count = 0 ]; then
  echo "$service is dead."
  sudo systemctl start $service
else
  echo "$service is alive."
fi

