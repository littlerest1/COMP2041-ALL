#!/bin/sh
while read line
do 
  echo "$line"|tr "0-4" "<"|tr "6-9" ">"
done < "${1:-/dev/stdin}"
