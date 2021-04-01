#!/bin/bash

cat "$1"|egrep "COMP[29]041"|cut -d'|' -f3|cut -d',' -f2|cut -d' ' -f2|sort|uniq -c|sort|tail -c 10|cut -d' ' -f2
