#!/bin/bash

DIR1=$1
DIR2=$2
ls ./$DIR1 | cut -f2 -d' ' > files.txt

while read line
do
    cd $DIR1
    YEAR=`stat -c %y $line | cut -f1 -d' ' | cut -f1 -d'-'`
    MONTH=`stat -c %y $line | cut -f1 -d' ' | cut -f2 -d'-'`
    DAY=`stat -c %y $line | cut -f1 -d' ' | cut -f3 -d'-'`
    
    mkdir -p "../$DIR2/$YEAR/$MONTH/$DAY"
    cp $line "../$DIR2/$YEAR/$MONTH/$DAY"
    
    cd ..
done < files.txt

rm files.txt

