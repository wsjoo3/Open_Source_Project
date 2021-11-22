#!/bin/bash

result=$(echo "$1/($2*$2/10000)" | bc -l)
a=18.5
b=23

if [ $(echo "${a} > ${result}" | bc -l) -ne 0 ]; then
	echo "저체중입니다."
elif [ $(echo "${result} >=  ${b}" | bc -l) -ne 0 ]; then
	echo "과체중입니다."
else
	echo "정상체중입니다."
fi

exit 0
