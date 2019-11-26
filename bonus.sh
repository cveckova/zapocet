#!/bin/bash

ADR="https://arxiv.org/abs/"

while [ "$#" -gt 0 ]
do
	echo "---"
	ADRESA=$ADR$1
	
	wget -q $ADRESA -O index.html

	tr -d "\n" < index.html | tr '<' '\n' | grep 'meta.*'| grep 'citation.*' | sed 's/content//'|tr -d " " | sed 's/metaname="citation_//' | sed 's/"=/=/' | tr -d "/>" 
	shift 1
done
	
#wget -q $ADRESA -O index.html


#tr -d "\n" < index.html | tr '<' '\n' | grep 'meta.*'| grep 'citation.*' | sed 's/content//'|tr -d " " | sed 's/metaname="citation_//' | sed 's/"=/=/' | tr -d "/>" 


#tr '"' '='   #| grep -v "meta"
#meta name="citation_date" ="2016/03/09"/>  
