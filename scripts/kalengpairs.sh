#!/bin/bash

# Script to pair sme and nob from the kaleng.xml file
# This file is called from the makefile.

echo "LEXICON Root" > ../bin/ke.lexc

cat kaleng.xml | grep -v DELETE | tr '\n' ' ' | sed 's/<e>/£/g' | tr '£' '\n' | cut -d">" -f2 | cut -d"<" -f1 | tr -d ":" | tr ' ' '_' > ../bin/k.dic

cat kaleng.xml | grep -v DELETE | tr '\n' ' ' | sed 's/<e>/£/g' | tr '£' '\n' | cut -d">" -f4 | cut -d"<" -f1 | tr -d ":" |  tr ' ' '_' > ../bin/e.dic

paste -d":" ../bin/k.dic ../bin/e.dic > ../bin/ke.list

cat ../bin/ke.list | sed 's/;/,,/g' | sed 's/$/ # ;/g' | grep -v '^: # ;' | sed 's/\!/%\!/g' | tr '"' '’' >> ../bin/ke.lexc


