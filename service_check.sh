#!/bin/bash

if [ $# = 0  ]; then

  echo "Not File"
  exit 0

elif [ -e $1 ]; then

  echo $1
  exit 0

else

  for i in $(seq 1 $#)
  do

    service=${i}

    count=`ps -ef | grep $service | grep -v grep | wc -l`

    if [ $count = 0 ]; then
      echo "$service is dead."
      sudo systemctl start $service
    else
      echo "$service is alive."
    fi
 
  done

fi
