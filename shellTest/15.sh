#!/bin/bash

#使用user.txt文件中的人员名单，在计算机中自动创建对应的账户并配置初始密码
#本执行脚本需要提前准备一个user.txt文件，该文件中包含有若干用户名信息

#for i in `cat user.txt`
#do 
#	useradd $i
#	echo "123456" | passwd --stdin $i
#done


while read Line
do
	useradd $Line
	echo "123456" | passwd --stdin $Line
done < user.txt
