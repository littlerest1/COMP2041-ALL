#!/bin/bash
s=0
m=0
l=0
for entry in "/tmp_amd/ravel/export/ravel/3/z5161462/Desktop/comp2041/lab03/test"/*
do
  if [ "$(wc -l $entry|cut -d" " -f1)" -lt "10" ]
    then small[s]="$(wc -l $entry|cut -d' ' -f2|cut -c 68-100)"
         s=$(($s+1))
        # echo "${small[*]}"
  elif [ "$(wc -l $entry|cut -d" " -f1)" -ge "10" ] &&  [ "$(wc -l $entry|cut -d" " -f1)" -lt "100" ] 
    then medium[m]="$(wc -l $entry|cut -d' ' -f2|cut -c 68-100)"
         m=$(($m + 1))
  else large[l]="$(wc -l $entry|cut -d' ' -f2|cut -c 68-100)"
        l=$(($l+1))
  fi
done

small=($(sort <<<"${small[*]}"))
echo "Small files: ${small[*]}"
medium=($(sort <<<"${medium[*]}"))
echo "Medium-sized files: ${medium[*]}"
large=($(sort <<<"${large[*]}"))
echo "Large files: ${large[*]}"

