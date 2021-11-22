#!/bin/bash

if [ ! -d $1 ]; then
	mkdir $1
fi
if [ -d $1 ]; then
	for i in 0 1 2 3 4
	do
		if [ ! -f $1/file$i ]; then
			touch $1/file$i.txt
		fi
	done
	tar -cf $1/$1.tar $1/*.txt
	if [ ! -d $1/$1 ]; then
		mkdir $1/$1
	fi
	mv $1/$1.tar $1/$1/.
	tar -xf $1/$1/$1.tar -C $1
fi
exit 0
