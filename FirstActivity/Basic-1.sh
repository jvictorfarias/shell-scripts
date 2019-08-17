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


# Substituir pelo caminho do projeto nessa parte
var=1;
cat conquistas.txt | tr "/" " " | tr " " "_" | tr '[:upper:]' '[:lower:]' > conquistas_formatted.txt;
while read line; do
    mkdir ./ufc_quixada/redes_de_computadores/conquistas/"$line"
    ln -s -t ~/Documents/Scripts/FirstActivity/ufc_quixada/redes_de_computadores/conquistas/"$line" ~/Documents/Scripts/FirstActivity/ufc_quixada/redes_de_computadores/grade_curricular/"$line"
    mv ~/Documents/Scripts/FirstActivity/ufc_quixada/redes_de_computadores/conquistas/"$line"/"$line" ~/Documents/Scripts/FirstActivity/ufc_quixada/redes_de_computadores/conquistas/"$line"/programa
    
    links=$(head -n $var professores_links.txt | tail -n -1 | cat)
    ln -s -t ~/Documents/Scripts/FirstActivity/ufc_quixada/redes_de_computadores/conquistas/"$line" ~/Documents/Scripts/FirstActivity/ufc_quixada/redes_de_computadores/professores/"$links"/
    mv ~/Documents/Scripts/FirstActivity/ufc_quixada/redes_de_computadores/conquistas/"$line"/"$links" ~/Documents/Scripts/FirstActivity/ufc_quixada/redes_de_computadores/conquistas/"$line"/professor
    var=$((var+1))
done < conquistas_formatted.txt

tar -czvf ufc_quixada.tar.gz ufc_quixada