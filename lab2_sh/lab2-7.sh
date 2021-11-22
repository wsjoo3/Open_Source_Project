#!/bin/bash

if [ ! -d $1 ]; then
	mkdir $1
fi
if [ -d $1 ]; then
	for i in 0 1 2 3 4
	do
	if [ ! -f $1/file$i.txt ]; then
		touch $1/file$i.txt
	fi
	if [ ! -d $1/file$i ]; then
		mkdir $1/file$i
	fi
	if [ ! -h $1/file$i/file$i.txt ]; then
		ln -s $1/file$i.txt $1/file$i/file$i.txt
	fi
	done
fi
exit 0
