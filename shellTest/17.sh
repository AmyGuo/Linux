#!/bin/bash

#点名器

#该脚本需要提前准备一个user.txt文件，该文件中需要包含所有姓名的信息，一行一个姓名，脚本每次随机显示一个姓名

while :
do 
	line=`cat user.txt | wc -l`
	num=$[RANDOM%line+1]
	sed -n "${num}p" user.txt
	sleep 0.2
	#clear
done

