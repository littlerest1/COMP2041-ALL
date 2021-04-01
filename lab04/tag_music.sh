#!/bin/bash

root=`echo "$1"|cut -d'/' -f1`
#echo "$root"
for file in "$root"/*/*.mp3;
do  
  #printf "\n $file \n"
  Title=`echo "$file"|sed 's/.mp3//g'|cut -d'-' -f2-|rev|sed 's/ - /%/g'|cut -d'%' -f2-|rev|sed 's/^ *//g'`
  #echo "$Title"
  id3 -t  "$Title" "$file" 2>&1 >/dev/null
    
  Artist=`echo "$file"|sed 's/.mp3//g'|cut -d'-' -f2-|rev|sed 's/ - /%/g'|cut -d'%' -f1|rev|sed 's/^ *//g'`
  #echo "$Artist"
  id3 -a  "$Artist" "$file" 2>&1 >/dev/null
  
  Album=`echo "$file"|cut -d'/' -f2`
  #echo "$Album"
  id3 -A  "$Album" "$file" 2>&1 >/dev/null
  
  Year=`echo "$Album"|cut -d',' -f2|sed 's/^ *//g'`
  #echo "$Year"
  id3 -y  "$Year" "$file" 2>&1 >/dev/null
  
  Track=`echo "$file"|cut -d'/' -f 3|cut -d' ' -f1`
  #echo "$Track"
  id3 -T  "$Track" "$file" 2>&1 >/dev/null
done


