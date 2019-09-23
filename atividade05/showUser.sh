#!/bin/bash

line=`grep -n $1 emails_database.txt | cut -f2 -d':'`;
echo $line
