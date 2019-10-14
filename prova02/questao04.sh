#!/bin/bash

multTable(){
    clear
    tput setaf 4
    tput bold
    tput cup 0 3
    seq -s "  " 1 $1
    
    tput cup 2 0
    for ((i=2; i <= `expr $1 + 1`; i++))
    do
        tput cup $i 0
        printf "%d" `expr $i - 1`
        
    done
    
    tput sgr0
    COLUMN_HANDLER=3
    for ((j=2; j <= `expr $1 + 1`; j++))
    do
        for ((k=2; k <= `expr $1 + 1`; k++))
        do
            tput cup $k $COLUMN_HANDLER
            VAL=`expr $k - 1`
            MULT=`expr $j - 1`
            if [ $VAL -eq $MULT ]
            then
                tput smul
                echo "`expr $VAL \* $MULT`"
                tput rmul
            else
                echo "`expr $VAL \* $MULT`"
            fi
        done
        COLUMN_HANDLER=`expr $COLUMN_HANDLER + 3`
    done
    
    
}


multTable $1
