#!/bin/sh
pre="$(echo "$1"|cut -c 1-1)" 
wget -q -O- "http://www.handbook.unsw.edu.au/vbook2018/brCoursesByAtoZ.jsp?StudyLevel=Undergraduate&descr="$pre""|grep "$1"|cat -A|sed '1,10p'|uniq|cut -d " " -f2-|cut -d ">" -f2-|cut -d "=" -f2-|cut -d "." -f6-|cut -d"$" -f1,3|sed -e "s/</ /g"|sed -e "s/>/ /g"|sed -e 's|["'\'']||g'|cut -d " " -f1,3,4|tr -d '\n' 
