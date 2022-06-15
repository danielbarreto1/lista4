#!/bin/bash

read -p "Digite o nome do arquivo: " non 
echo

cat $non | sed -r 's/[[:alnum:]].* {2,}/ /g'

