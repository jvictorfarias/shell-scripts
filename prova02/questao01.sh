#!/bin/bash
generateHTML(){
    echo "<html>
  <head>
    <title>Meus Links Favoritos</title>
  </head>
  <body>
    <p>Apresento aqui meus sites favoritos:</p>
    <br />
  </body>
</html>
    " > $2.html
    
    while read line
    do
        TOPIC=`echo $line | cut -f1 -d':'`
        URL=`echo $line | cut -f2 -d':'`
        TAG="<a href=\"https://"$URL"\">$TOPIC</a><br/>"
        sed -i "/<\/body>.*/i $TAG" $2.html
    done < $1
}

getopts "o:i:" OPTVAR

case $OPTVAR in
    "i")
        FILE=$OPTARG
        getopts "o:" OPTVAR
        if [ "$OPTVAR" == "o" ]
        then
            HTML=$OPTARG
        else
            echo "Opção inválida!"
            exit 1
        fi
        generateHTML $FILE $HTML
    ;;
    "o")
        HTML=$OPTARG
        getopts "i:" OPTVAR
        if [ "$OPTVAR" == "i" ]
        then
            FILE=$OPTARG
        else
            echo "Opção inválida!"
        fi
        generateHTML $FILE $HTML
    ;;
    "*")
        echo "Opção inválida!"
    ;;
esac