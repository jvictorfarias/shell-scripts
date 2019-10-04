#!/bin/bash

read -p "Digite o caminho do arquivo: " TARGET

cat $TARGET | tr '[[:punct:]]' '\n' > file.txt

declare -A vector

while read word
do
    for index in $word
    do
        let vector[$index]++
    done
    # echo "$word"
done < file.txt

for word in ${!vector[@]}
do
    echo "$word: ${vector[$word]}"
done