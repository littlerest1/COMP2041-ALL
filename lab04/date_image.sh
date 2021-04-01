#!/bin/bash

day=`date|cut -f-1,2,3,4 -d' '|cut -f-1,2 -d':'`
#echo "$day"
convert -gravity south -pointsize 36 -draw  "text 50,100 \"$day\"" "$1" "$1"


