#!/bin/bash

nota1=$(sed -E 's/[^0-9,]//g;1,2d;s/\,/\./g' ./primeira_prova.txt | head -n 1)
nota2=$(sed -E 's/[^0-9,]//g;1,2d;s/\,/\./g' ./segunda_prova.txt | head -n 1)
nota3=$(sed -E 's/[^0-9,]//g;1,2d;s/\,/\./g' ./terceira_prova.txt | head -n 1)
echo "($nota1+$nota2+$nota3)/3" | bc