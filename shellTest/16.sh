#!/bin/bash

#编写批量修改扩展名脚本，如批量将txt文件改为doc文件
#执行脚本时，需要给脚本添加位置参数
#脚本名 txt doc (将txt的扩展名改为doc)

#for i in `ls *.$1`
#do
#	mv $i ${i%.*}.$2
#done

#file=example.tar.gz
# ${file%%.*} example 
# ${file$.*} example.tar
# ${file##*.} gz
# ${file#*.} tar.gz

for i in `ls *.$1`
do 
	name=`echo $i | awk -F '.' '{print $1}'`
	mv $i $name.$2
done
