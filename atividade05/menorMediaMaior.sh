#!/bin/bash

menor=`echo $* | tr ' ' '\n' | sort | head -n 1`
maior=`echo $* | tr ' ' '\n' | sort | tail -n 1`
soma=`echo $* | tr ' ' '+' | bc`
media=`echo $soma/$# | bc`
echo $menor
echo $media
echo $maior