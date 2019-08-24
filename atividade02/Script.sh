#!/bin/sh

# Vars
var=1;
# Caminho da chave de permissão e nome do usuário
key="~/Documents/Scripts/Permission/joaovictor.pem";
user="joaovictor";

# Criação dos diretórios
cat disciplinas.txt | tr "/" " " | tr " " "_" | tr '[:upper:]' '[:lower:]' > disciplinas_formatted.txt;
while read line; do
    mkdir -p ./ufc_quixada/redes_de_computadores/grade_curricular/"$line"
done < disciplinas_formatted.txt

cat professores.txt | tr "/" " " | tr " " "_" | tr '[:upper:]' '[:lower:]' > professores_formatted.txt;
while read line; do
    mkdir -p ./ufc_quixada/redes_de_computadores/professores/"$line"
done < professores_formatted.txt


# Criação dos links simbólicos e diretórios de conquistas
cat conquistas.txt | tr "/" " " | tr " " "_" | tr '[:upper:]' '[:lower:]' > conquistas_formatted.txt;
while read line; do
    mkdir -p ./ufc_quixada/redes_de_computadores/conquistas/"$line";
    links=$(head -n $var professores_links.txt | tail -n -1 | cat);
    cd ufc_quixada/redes_de_computadores/conquistas/"$line";
    ln -s ../../grade_curricular/"$line" "$line";
    ln -s ../../professores/"$links"/ "$links";
    cd -;
    var=$((var+1))
done < conquistas_formatted.txt

# Compressão
tar -czvf ufc_quixada.tar.gz ufc_quixada;

# Envio para o servidor
ssh -t -i $key $user@scripts.joao.marcelo.nom.br 'mkdir -p ~/atividades/atividade02';
scp -i $key ufc_quixada.tar.gz $user@scripts.joao.marcelo.nom.br:~/atividades/atividade02;
ssh -t -i $key $user@scripts.joao.marcelo.nom.br 'cd ~/atividades/atividade02/; tar -xzvf ufc_quixada.tar.gz; rm -rf ufc_quixada.tar.gz';

# Alteração da permissão

ssh -t -i $key $user@scripts.joao.marcelo.nom.br 'chmod 555 ~/atividades/atividade02/ufc_quixada/redes_de_computadores/grade_curricular';
ssh -t -i $key $user@scripts.joao.marcelo.nom.br 'chmod 555 ~/atividades/atividade02/ufc_quixada/redes_de_computadores/professores';
