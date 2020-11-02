#!/bin/bash

#对100以内的正整数相加求和

sum=0
for i in `seq 100`
do 
	sum=$[sum+i]
done
echo "1+2+...+99+100=$sum"
