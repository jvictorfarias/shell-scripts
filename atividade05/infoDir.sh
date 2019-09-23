#!/bin/bash
DIRETORIO=$1
qtdArquivos=`ls -l $DIRETORIO | grep -e "^-" | wc -l`
qtdDiretorios=`ls -l $DIRETORIO | grep -e "^d" | wc -l`
qtdItens=`expr $qtdArquivos + $qtdDiretorios`
tamanhoDir=`du -hs $DIRETORIO 2> /dev/null | cut -f1`

if [ -d "$DIRETORIO" ]
then
    echo O diretório $DIRETORIO ocupa $tamanhoDir e tem $qtdItens itens.
else
    echo não é um diretório!!!
fi
