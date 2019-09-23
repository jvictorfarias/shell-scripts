#!/bin/bash
primeiro=$1
segundo=$2
terceiro=$3
maior=$primeiro

if [ $segundo -gt $primeiro ] && [ $segundo -gt $terceiro ]
then
    maior=$segundo
fi

if [ $terceiro -gt $primeiro ] && [ $terceiro -gt $segundo ]
then
    maior=$terceiro
fi

echo $maior
