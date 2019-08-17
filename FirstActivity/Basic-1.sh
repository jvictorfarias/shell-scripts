#!/bin/sh

mkdir -p ./ufc_quixada/redes_de_computadores/grade_curricular;
mkdir -p ./ufc_quixada/redes_de_computadores/professores;
mkdir -p ./ufc_quixada/redes_de_computadores/conquistas;

cat disciplinas.txt | tr "/" " " | tr " " "_" | tr '[:upper:]' '[:lower:]' > disciplinas_formatted.txt;
while read line; do
    mkdir ./ufc_quixada/redes_de_computadores/grade_curricular/"$line"
done < disciplinas_formatted.txt

cat professores.txt | tr "/" " " | tr " " "_" | tr '[:upper:]' '[:lower:]' > professores_formatted.txt;
while read line; do
    mkdir ./ufc_quixada/redes_de_computadores/professores/"$line"
done < professores_formatted.txt


cat conquistas.txt | tr "/" " " | tr " " "_" | tr '[:upper:]' '[:lower:]' > conquistas_formatted.txt;
while read line; do
    mkdir ./ufc_quixada/redes_de_computadores/conquistas/"$line"
    ln -s -t ~/Documents/Scripts/FirstActivity/ufc_quixada/redes_de_computadores/conquistas/"$line" ~/Documents/Scripts/FirstActivity/ufc_quixada/redes_de_computadores/grade_curricular/"$line"
    mv ~/Documents/Scripts/FirstActivity/ufc_quixada/redes_de_computadores/conquistas/"$line"/"$line" ~/Documents/Scripts/FirstActivity/ufc_quixada/redes_de_computadores/conquistas/"$line"/programa
done < conquistas_formatted.txt
