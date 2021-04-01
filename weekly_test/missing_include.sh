#!/bin/bash
  
for file in $@
do 
    while read line
    do
       if [[ $line = *"#include \""* ]];then
           y=$(echo $line|cut -d'"' -f2)
           if [ ! -f "$y" ];then
               echo "$y included into $file does not exist"
           fi
       fi
    done < "$file"
done
