#!/bin/bash

FILE=$1;

for VAR in `cat $FILE`
do
    AVG=`ping -c 10 $VAR | tail -1 | cut -d '/' -f 6`
    echo $VAR $AVG ms >> ips_ordenados.txt
done

cat ips_ordenados.txt | cut -f2 | sort;
rm ips_ordenados.txt
