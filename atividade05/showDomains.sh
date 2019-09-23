#!/bin/bash
domain=$1

users=`grep $domain emails_database.txt | wc -l`
echo $users users with this domain:
grep $domain emails_database.txt | cut -f1 -d':'
