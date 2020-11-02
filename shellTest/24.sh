#!/bin/bash

#统计/var/log下有多少个文件，并显示这些文件名

cd /var/log
sum=0
for i in `ls -r *`
do
	if [ -f $i ];then
		let sum++
		echo "文件名：$i"
	fi
done
echo "总文件数量为：$sum"

