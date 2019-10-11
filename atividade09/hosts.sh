#!/bin/bash

adicionar() {
    echo "$1:$2" >> hosts.db
}

remover() {
    sed -i '/^'$1'.*/d' hosts.db
}

procurar() {
    grep $1 hosts.db | cut -f2 -d':'
}

reverso(){
    grep $1 hosts.db | cut -f1 -d':'
}

listar() {
    cat hosts.db | tr ':' ' '
}

menu(){
    echo "Opção inválida! Opções disponíveis:"
    echo "AdicionarHost: -a <<Hostname>>"
    echo "AdicionarIP: -i <<IPADDR>>"
    echo "Remover: -d <<HOST | IP>>"
    echo "listar: -l"
}

while getopts "a:i:r:d:l" OPTVAR
do
    case "$OPTVAR" in
        "a") nome=$OPTARG
            getopts "a:i:r:d:l" OPTVAR
            if [ "$OPTVAR" == "i" ]
            then
                IP=$OPTARG
            else
                echo "União de opções inválida"
                exit 1
            fi
            adicionar $nome $IP
        ;;
        "i") IP=$OPTARG
            getopts "a:i:r:d:l" OPTVAR
            if [ "$OPTVAR" == "a" ]
            then
                nome=$OPTARG
            else
                echo "União de opções inválida!"
                exit 1
            fi
            adicionar $nome $IP
        ;;
        "l") listar
            exit 0
        ;;
        "d") remover $OPTVAR
        ;;
        *) menu
        ;;
        
    esac
done