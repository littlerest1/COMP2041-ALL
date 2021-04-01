#!/bin/bash

if [[ "$#" -lt "3" ]]
	then
		echo "Incorrect argument"
		exit 1
fi

for((i=$1;i<=$2;++i))
do
    echo "$i"
done > "$3"
