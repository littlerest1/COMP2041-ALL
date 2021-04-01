#!/bin/bash

#IFS='
#'
IFS='
'
for f in *.htm
do
   y=$(echo $f|cut -d'.' -f1)
   new="$y.html"
   for x in *
   do
       name=$(echo $x)
       if [ "$name" = "$new" ];then
           echo "$name exists"
           exit 1
       fi
   done
   mv "$f" "$new"
done
