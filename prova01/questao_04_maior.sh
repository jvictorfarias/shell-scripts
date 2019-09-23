#!/bin/bash

sed -E 's/[^0-9,]//g;1,2d;s/\,/\./g' ./primeira_prova.txt | head -n 1 >> notas_joao.txt
sed -E 's/[^0-9,]//g;1,2d;s/\,/\./g' ./segunda_prova.txt | head -n 1 >> notas_joao.txt
sed -E 's/[^0-9,]//g;1,2d;s/\,/\./g' ./terceira_prova.txt | head -n 1 >> notas_joao.txt

cat notas_joao.txt | sort | head -n 1

rm notas_joao.txt
