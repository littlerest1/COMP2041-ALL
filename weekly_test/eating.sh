#!/bin/bash
for file in $@
do 
  while read line
  do
     if [[ $line=*"name"* ]];then
          y=$(echo $line |cut -d':' -f 2|cut -d',' -f 1|cut -d'"' -f 2|cut -d'[' -f 1|cut -d']' -f 1)
          echo $y >> temp.txt
     fi
  done < "$file"
done

cat temp.txt|sort|uniq|tail -n +2
