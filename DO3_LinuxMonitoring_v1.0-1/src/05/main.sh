#!/bin/bash
cd $(dirname $0)
if [ $# != 1 ];
then
    echo "Error: Input 1 parametr: ./main.sh <param1>"
else
  if ! [ -d $1 ]; then
    echo 'Error: No directory, enter /<directory name>/'
  else
    chmod +x top.sh
    ./top.sh $1
  fi
fi