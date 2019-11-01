#!/bin/bash
gzipCompression(){
    cd $1
    FILE_NAME=$2
    shift 2
    LIST_OF_FILES=($@)
    tar -czf $FILE_NAME.tar.gz `echo ${LIST_OF_FILES[@]}`
    clear
    dialog --msgbox "Files Compressed!" 0 0
}

b2zipCompression(){
    cd $1
    FILE_NAME=$2
    shift 2
    LIST_OF_FILES=($@)
    tar -cjf $FILE_NAME.tar.bz2 `echo ${LIST_OF_FILES[@]}`
    clear
    dialog --msgbox "Files Compressed!" 0 0
}


DIR_PATH=`dialog --inputbox --stdout \
"Digite o caminho do diretório a ser listado:" 0 0`

clear

COMMAND="dialog --stdout --checklist Select 0 0 0 "
for LINHA in `ls -al "$DIR_PATH" | grep '^-' | cut -d ' ' -f 11`
do
    COMMAND=`echo $COMMAND $LINHA \'File\' OFF`
done

clear

LIST=`$COMMAND`
LIST_OF_FILES=($LIST)

if [ ${#LIST_OF_FILES[@]} -gt 0 ]
then
    COMPRESS_OPT=`dialog --stdout --menu "Compress options:" 0 0 0 1 gzip 2 b2zip`
    COMPRESS_NAME=`dialog --inputbox --stdout "File name: " 0 0`
    if [ $COMPRESS_OPT -eq 1 ]
    then
        gzipCompression $DIR_PATH $COMPRESS_NAME ${LIST_OF_FILES[@]}
    elif [ $COMPRESS_OPT -eq 2 ]
    then
        b2zipCompression $DIR_PATH $COMPRESS_NAME ${LIST_OF_FILES[@]}
    else
        dialog --msgbox "Operation canceled." 0 0
    fi
else
    clear
    dialog --msgbox 'No file selected!' 0 0
fi
