#!/bin/bash

	cd $@1
	x=0;
	f=0;
	for file in *
	do 		
	   fN[$x]=$file
	   x=$((x+1))
	done
	fN=$(sort $fN)
	cd ..
	cd $@2
	y=0
	for file in *
	do
		#echo $file
		if [ $y -gt $x ];then
			break;
		fi
		#echo "cd $file \n ${fN[$y]}";
		if [ "$file" == "${fN[$y]}" ];then
			k=0;
			while read line
			do	
				#echo "line $line"
				f1[$k]=$line
				k=$((k+1))
			done < "${fN[$y]}"
			flag=0;
			j=0;
			cd ..
			cd $1
			while read line
			do
					#echo $line
					if [ "$line" != "${f1[$j]}" ];then	
						flag=1
					fi
					j=$((j+1))
			done < "${fN[$y]}"
			if [ $flag == 0 ];then
				final[f]=$file
				f=$((f+1))
			fi
			y=$((y+1))
		fi
	done

echo $final;	
