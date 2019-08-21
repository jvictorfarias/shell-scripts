#!/bin/bash

# Vars
var=1;
pathing=$PWD;

cat disciplinas.txt | tr "/" " " | tr " " "_" | tr '[:upper:]' '[:lower:]' > disciplinas_formatted.txt;
while read line; do
    mkdir -p ./ufc_quixada/redes_de_computadores/grade_curricular/"$line"
done < disciplinas_formatted.txt

cat professores.txt | tr "/" " " | tr " " "_" | tr '[:upper:]' '[:lower:]' > professores_formatted.txt;
while read line; do
    mkdir -p ./ufc_quixada/redes_de_computadores/professores/"$line"
done < professores_formatted.txt


cat conquistas.txt | tr "/" " " | tr " " "_" | tr '[:upper:]' '[:lower:]' > conquistas_formatted.txt;
while read line; do
    mkdir -p ./ufc_quixada/redes_de_computadores/conquistas/"$line";
    cd $pathing/ufc_quixada/redes_de_computadores/conquistas/"$line";
    ln -s $pathing/ufc_quixada/redes_de_computadores/grade_curricular/"$line" "$line";
    cd -;
    links=$(head -n $var professores_links.txt | tail -n -1 | cat);
    cd $pathing/ufc_quixada/redes_de_computadores/conquistas/"$line"
    ln -s $pathing/ufc_quixada/redes_de_computadores/professores/"$links"/ "$links";
    cd -;
    var=$((var+1))
done < conquistas_formatted.txt

tar -czvf ufc_quixada.tar.gz ufc_quixada