#!/bin/bash

for filename in "$@"
do
    echo "$filename"
   # display "$filename"
    printf "Address to e-mail this image to? "
    read address
    echo "$address"
       
    printf "Message to accompany image? "
    read message
 
        
    if [ ! -z "$address" -a "$address" != " " ];
    then 
       echo "$message"| mail -s "$filename" user@example.com
       echo "$filename sent to $address"
    fi
    
done
