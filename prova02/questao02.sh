#!/bin/bash

bubbleSort(){
    LENGTH=`expr $1 - 1`
    shift 1
    ARRAY=($@)
    
    echo "Ordenando por Bubble Sort..."
    for ((i=$LENGTH; i > 0; i--))
    do
        for ((j=0; j < $i; j++))
        do
            INCR=`expr $j + 1`
            if [ ${ARRAY[$j]} -gt ${ARRAY[$INCR]} ]
            then
                AUX=${ARRAY[$j]}
                ARRAY[$j]=${ARRAY[$INCR]}
                ARRAY[$INCR]=$AUX
            fi
            
        done
    done
    
    
    echo "Vetor ordenado: ${ARRAY[@]}"
}


populate(){
    for ((i=0; i < $1; i++))
    do
        UNSORTED[$i]=$RANDOM;
    done
    
    echo "Vetor Aleatório: ${UNSORTED[@]}"
    
    bubbleSort ${#UNSORTED[@]} ${UNSORTED[@]}
}

populate $1
