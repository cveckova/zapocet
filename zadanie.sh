#!/bin/bash

ADR="https://arxiv.org/search/?query="

for A in $@
do
	ADR=$ADR+$A
done

KONIEC="&searchtype=all&source=header"

ADRESA=$ADR$KONIEC

wget -q $ADRESA -O index.html

tr -d "\n" < index.html | tr '<' '\n' | grep 'a href=.*' | grep -v 'search' | tr '>' '\n' | grep 'arXiv:.*' | tr ':' '\n' | grep -v 'arXiv'
