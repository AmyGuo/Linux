#!/bin/bash

# Description:
# 批量创建文件

for i in {1..9}
do
	for j in {1..9}
	do
		for k in {1..9}
		do
			touch /mnt/workspace/src/algo/shellTest/filetest/$i$j$k.txt
		done
	done
done
 
