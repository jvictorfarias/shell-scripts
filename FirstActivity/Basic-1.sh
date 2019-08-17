#!/bin/sh

mkdir -p ./ufc_quixada/redes_de_computadores/professores;
mkdir -p ufc_quixada/redes_de_computadores/grade_curricular;
while read line; do
    mkdir ./ufc_quixada/redes_de_computadores/grade_curricular/"$line"
done < disciplinas.txt
