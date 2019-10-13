#!/bin/bash

bubbleSort(){
    local -a LENGTH=`expr $1 - 1`
    shift 1
    local -a ARRAY=($@)
    
    INIT_BS=`date +%s`
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
    
    echo "Vetor Ordenado pelo Bubble Sort: ${ARRAY[@]}"
}


selectSort(){
    local -a ARRAY=($@)
    
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
    
    echo "Vetor Ordenado pelo Select Sort: ${ARRAY[@]}"
    
}

quickSort(){
    
    local -a FIRST=$1
    local -a LAST=$2
    local -a i=$FIRST
    local -a j=`expr $LAST - 1`
    
    
    PIVOT_INDEX=`expr $FIRST + $LAST`
    PIVOT_INDEX=`expr $PIVOT_INDEX / 2`
    PIVOT=${ARRAY[$PIVOT_INDEX]}
    
    while [ $i -le $j ]
    do
        while [[ ${ARRAY[$i]} -lt $PIVOT && $i -lt $LAST ]]
        do
            let i++;
        done
        
        while [[ ${ARRAY[$j]} -gt $PIVOT && $j -gt $FIRST ]]
        do
            let j--;
        done
        
        if [ $i -le $j ]
        then
            AUX=${ARRAY[$i]}
            ARRAY[$i]=${ARRAY[$j]}
            ARRAY[$j]=$AUX
            let i++;
            let j--;
        fi
    done
    if [ $j -gt $FIRST ]
    then
        quickSort $FIRST `expr $j + 1`
    fi
    
    if [ $i -lt $LAST ]
    then
        quickSort $i $LAST
    fi
    
    
}

populate(){
    for ((i=0; i < $1; i++))
    do
        ARRAY[$i]=$RANDOM;
    done
    
    echo "Vetor Aleatório: ${ARRAY[@]}"
    
    # Select Sort
    echo "Ordenando por Select Sort..."
    INIT_BS=`date +%s`
    selectSort ${ARRAY[@]}
    END_BS=`date +%s`
    ELAPSED_TIME=`expr $END_BS - $INIT_BS`
    echo "Duração de execução do Select Sort: $ELAPSED_TIME"
    
    # Bubble Sort
    echo "Ordenando por Bubble Sort..."
    INIT_BS=`date +%s`
    bubbleSort ${#ARRAY[@]} ${ARRAY[@]}
    END_BS=`date +%s`
    ELAPSED_TIME=`expr $END_BS - $INIT_BS`
    echo "Duração de execução do Bubble Sort: $ELAPSED_TIME"
    
    # Quick Sort
    echo "Ordenando por Quick Sort..."
    INIT_BS=`date +%s`
    quickSort 0 ${#ARRAY[@]}
    echo "Vetor Ordenado pelo Quick Sort: ${ARRAY[@]}"
    END_BS=`date +%s`
    ELAPSED_TIME=`expr $END_BS - $INIT_BS`
    echo "Duração de execução do Quick Sort: $ELAPSED_TIME"
    
}

populate $1
