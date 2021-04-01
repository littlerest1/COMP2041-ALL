#!/bin/bash
for file in $@
do
	num=0
	#echo $num
	name=$(echo ".$file.")
	#echo $name
	flag="0"
	while [ $flag -eq 0 ]
	do
		name=$(echo ".$file.$num") 
		if [ -f "$name" ];then
		   num=$((num+1))
		else
		    flag="1"
		fi
	done
	name=$(echo ".$file.$num")
	cp $file $name
	echo "Backup of '$file' saved as '$name'"
done
	
