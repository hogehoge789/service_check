#!/bin/bash

function Func01 ()
{ 
  for i in $(seq 1 $#)
  do

    echo $1
    echo '$i'
    local service=${i}

    local count=`ps -ef | grep $service | grep -v grep | wc -l`

    if [ $count = 0 ]; then
      echo "$service is dead."
      sudo systemctl start $service
    else
      echo "$service is alive."
    fi

  done
}

if [ $# = 0  ]; then

  echo "Please specify file or service argument"
  exit 0

elif [ -e $1 ]; then

  echo $1
  exit 0

else

  Func01

fi
