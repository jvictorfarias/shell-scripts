#!/bin/bash

INTERVAL=$1;
PATH_MONITOR=$2;
OLD_COUNT=`ls -l $PATH_MONITOR | sed 1d | wc -l`;

ls -l $PATH_MONITOR | cut -d ' ' -f 9 | sort > oldDir.txt;

while true
do
    ls -l $PATH_MONITOR |  cut -d ' ' -f 9 | sort > newDir.txt;
    NEW_COUNT=`ls -l $PATH_MONITOR | sed 1d | wc -l`;
    if [ ! -z "`comm -3 newDir.txt oldDir.txt`" ]
    then
        newfiles=`comm -2 -3 newDir.txt oldDir.txt`;
        oldfiles=`comm -1 -3 newDir.txt oldDir.txt`;
        if [ $NEW_COUNT -gt $OLD_COUNT ]
        then
            echo " [`date`] Alteração! $OLD_COUNT->$NEW_COUNT. Adicionados: `echo $newfiles | tr '\n' ' '`" >> dirSensors.log
        elif [ $NEW_COUNT -lt $OLD_COUNT ]
        then
            echo " [`date`] Alteração! $OLD_COUNT->$NEW_COUNT. Removidos: `echo $oldfiles | tr '\n' ' '`" >> dirSensors.log
        else
            echo " [`date`] Alteração! $OLD_COUNT->$NEW_COUNT. Adicionados: `echo $newfiles | tr '\n' ' '`" >> dirSensors.log
            echo " [`date`] Alteração! $OLD_COUNT->$NEW_COUNT. Removidos:`echo $oldfiles | tr '\n' ' '`" >> dirSensors.log
            
        fi
    fi
    sleep $INTERVAL;
    mv newDir.txt oldDir.txt;
    OLD_COUNT=$NEW_COUNT;
done
