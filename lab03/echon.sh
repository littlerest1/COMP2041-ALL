#!/bin/bash
if [[ $# != 2 ]]
    then echo "Usage: "$0" <number of lines> <string>"
    exit 1
fi
if [[ $1 =~ ^-?[0-9]+$ ]]
   then
l=$1
if ((l < 0))
    then echo ""$0": argument 1 must be a non-negative integer"
    exit 1
fi
while [ "$l" -gt "0" ]
do
    l="$(($l - 1))"
    echo $2
  #  $1 =$(($1-1))
done
else echo ""$0": argument 1 must be a non-negative integer"
     exit 1
fi
