#!/bin/bash

lineNumber=`grep -n $1 emails_database.txt | cut -c 1`;
sed -i ''"$lineNumber"'d' emails_database.txt
