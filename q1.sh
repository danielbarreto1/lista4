#!/bin/bash

sed -E -e 's/[0-9]+/:/2' -e '1,2d' < nomes.txt > temp.txt

echo -e "Ranking Meninas\n" > meninas.txt

awk 'BEGIN {FS = ":"} {print NR "" $2}' < temp.txt >> meninas.txt

rm temp.txt
