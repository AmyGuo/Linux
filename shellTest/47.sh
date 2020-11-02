#!/bin/bash

# Description:
# 打印斐波那契数列

list=(0 1) 

for i in `seq 2 11`
do
	list[$i]=`expr ${list[i-1]} + ${list[i-2]}`
done
echo ${list[@]}
