#!/bin/bash
COMANDO=$1
case $COMANDO in
    "start") echo "Iniciando Serviço" ;;
    "stop") echo "Parando Serviço" ;;
    "restart") echo "Reiniciando Serviço" ;;
    *) echo "Uso: ./servico.sh (start|stop|restart)" ;;
esac
