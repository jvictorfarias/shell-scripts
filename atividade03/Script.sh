#!/bin/bash

key="~/Documents/Scripts/Permission/joaovictor.pem";
user="joaovictor";

ssh -t -i $key $user@scripts.joao.marcelo.nom.br 'mkdir -p ~/atividades/atividade03';

scp -i $key $PWD/emailsordenados.txt $user@scripts.joao.marcelo.nom.br:~/atividades/atividade03/;
scp -i $key $PWD/expressoesregulares.txt $user@scripts.joao.marcelo.nom.br:~/atividades/atividade03/;

scp -i $key $PWD/parte_01.txt $user@scripts.joao.marcelo.nom.br:~/atividades/atividade03/;
scp -i $key $PWD/parte_02.txt $user@scripts.joao.marcelo.nom.br:~/atividades/atividade03/;
scp -i $key $PWD/parte_03.txt $user@scripts.joao.marcelo.nom.br:~/atividades/atividade03/;
scp -i $key $PWD/parte_04.txt $user@scripts.joao.marcelo.nom.br:~/atividades/atividade03/;
