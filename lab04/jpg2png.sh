#!/bin/bash


#find "$PWD" -type f -name "*.jpg"
for filename in *.jpg
do 
  temp=`echo "$filename"|sed 's/jpg/png/g'`
  if test -e  "$temp"
  then
      echo "$temp already exists"
  else
      convert "$filename" "$temp"
  fi
done
