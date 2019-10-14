#!/bin/bash

multTable(){
    clear
    tput setaf 1
    tput bold
    tput cup 0 3
    
    COLUMN_HANDLER=3
    for ((i=1; i <= $1; i++))
    do
        tput cup 0 $COLUMN_HANDLER
        printf "%d" $i
        COLUMN_HANDLER=`expr $COLUMN_HANDLER + 4`
    done
    
    tput cup 1 0
    for ((i=1; i <= $1; i++))
    do
        tput cup $i 0
        printf "%d" $i
        
    done
    
    tput sgr0
    COLUMN_HANDLER=3
    for ((j=1; j <= $1; j++))
    do
        for ((k=1; k <= $1; k++))
        do
            tput cup $k $COLUMN_HANDLER
            if [ $k -eq $j ]
            then
                tput smul
                echo "`expr $k \* $j`"
                tput rmul
            else
                echo "`expr $k \* $j`"
            fi
        done
        COLUMN_HANDLER=`expr $COLUMN_HANDLER + 4`
    done
    
    
}


multTable $1
