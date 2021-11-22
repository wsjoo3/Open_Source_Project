#!/bin/bash

cat DB.txt | while read line; do
if [[ $line == *$1* ]]; then
	echo $line
fi
done
exit 0
