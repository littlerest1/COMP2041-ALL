#!/bin/bash
#echo $1 $2
	if [ "$(ls -A $1)" ]; then
		cd $1
		x=0;
		f=0;
		for file in *
		do 		
		   fN[$x]=$file
		   x=$((x+1))
		done
	 IFS=$'\n' sorted=($(sort <<<"${fN[*]}"))
		#echo "files $fN"
		cd ..
		if [ "$(ls -A $2)" ]; then
			cd $2
			y=0
			while [ $y -lt $x ]
			do
				for file in *
				do
					#echo $file
					if [ $y -gt $x ];then
						break;
					fi
					#echo "cd $file \n ${fN[$y]}";
					if [ "$file" == "${fN[$y]}" ];then
						k=0;
						flag=0;
						#echo "current $PWD"
						while read line
						do	
							#echo "line $line"
							f1[$k]=$line
							k=$((k+1))
						done < "$file"
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
						if [ $j -ne $k ];then
							flag=1
						fi
						cd ..
						cd $2
						if [ $flag -eq 0 ];then
							#echo "in $file"
					
							final[$f]=$file
							#echo ${final[$f]}
							f=$((f+1))
							y=$((y+1))
						fi
					fi
				done
				y=$((y+1))
			done
		fi
	fi
#echo "end"
if [ "${final[0]}" != "" ];then
	n=0
	while [ $n -lt $f ]
	do
		echo ${final[$n]}
		n=$((n+1))
	done
fi
