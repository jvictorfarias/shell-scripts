#!/bin/bash
bubbleSort(){
    ARRAY=($@)
    echo "Ordenando BubbleSort..."
    for ((i=0; i < ${#ARRAY[@]}; i++))
    do
        LESSER_INDEX=$i
        LESSER_VALUE=${ARRAY[$i]}
        
        for ((j=$i; j < ${#ARRAY[@]}; j++))
        do
            if [ ${ARRAY[$j]} -le $LESSER_VALUE ]
            then
                LESSER_VALUE=${ARRAY[$j]}
                LESSER_INDEX=$j
            else
                continue
            fi
        done
        
        AUX=${ARRAY[$i]}
        ARRAY[$i]=${ARRAY[$LESSER_INDEX]}
        ARRAY[$LESSER_INDEX]=$AUX
        
    done
    echo "Vetor Ordenador: ${ARRAY[@]}"
}

populate(){
    for ((i=0; i < $1; i++))
    do
        UNSORTED[$i]=$RANDOM;
    done
    
    echo "Vetor Aleatório: ${UNSORTED[@]}"
    
    bubbleSort ${UNSORTED[@]}
}

populate $1
