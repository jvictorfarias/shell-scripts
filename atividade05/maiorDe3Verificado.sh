#!/bin/bash
primeiro=$1
segundo=$2
terceiro=$3
maior=$primeiro

#Verificação SE é número
expr $primeiro + 1 > /dev/null 2> /dev/null
if [ $? -gt 0 ]
then
    echo Opa!!! $primeiro não é número
    exit 1
fi

expr $segundo + 1 > /dev/null 2> /dev/null
if [ $? -gt 0 ]
then
    echo Opa!!! $segundo não é número
    exit 1
fi

expr $terceiro + 1 > /dev/null 2> /dev/null
if [ $? -gt 0 ]
