#!/bin/bash

# Questão 1
echo "grep -E 'Invalid user .+ from' ./auth.log | wc -l" >> ./auth_analise.txt

# Questão 2
echo "grep -E 'Invalid user .+ from' ./auth.log > malditos.txt" >> ./auth_analise.txt

# Questão 3
echo "grep -E 'Accepted publickey for joaovictor' ./auth.log| wc -l" >> ./auth_analise.txt

# Upload para o servidor

ssh -t -i '../Permission/joaovictor.pem' joaovictor@scripts.joao.marcelo.nom.br 'mkdir -p ~/atividades/atividade04'
scp -i '../Permission/joaovictor.pem' ./auth.log joaovictor@scripts.joao.marcelo.nom.br:~/atividades/atividade04/
scp -i '../Permission/joaovictor.pem' ./malditos.txt joaovictor@scripts.joao.marcelo.nom.br:~/atividades/atividade04/
scp -i '../Permission/joaovictor.pem' ./auth_analise.txt joaovictor@scripts.joao.marcelo.nom.br:~/atividades/atividade04/

