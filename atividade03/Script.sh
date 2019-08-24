#!/bin/bash

key="~/Documents/Scripts/Permission/joaovictor.pem";
user="joaovictor";

ssh -t -i $key $user@scripts.joao.marcelo.nom.br 'mkdir -p ~/atividades/atividade03';
ssh -t -i $key $user@scripts.joao.marcelo.nom.br '
touch ~/atividades/atividade03/emailsordenados.txt;
touch ~/atividades/atividade03/expressoesregulares.txt;';


scp -i $key $PWD/parte_01.txt $user@scripts.joao.marcelo.nom.br:~/atividades/atividade03/;
scp -i $key $PWD/parte_02.txt $user@scripts.joao.marcelo.nom.br:~/atividades/atividade03/;


# Dúvidas a serem sanadas:
# Parte02, Q2: Pode ser qualquer pontuação, ou estritamente o .?
# Parte02, Q3: FRASE COMEÇANDO