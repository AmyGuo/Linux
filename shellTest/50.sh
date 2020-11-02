#!/bin/bash

# Description:
# 判断文件或者目录是否存在

if [ $# -eq 0 ];then
	echo "未输入参数，请输入"
	echo "用法：$0 [文件名|目录名]"
	exit 1
fi

if [ -f $1 ];then
	echo "该文件存在"
	ls -l $1
else 
	echo "没有改文件"
fi

if [ -d $1 ];then
	echo "该目录存在"
	ls -ld $1
else
	echo "没有该目录"
fi
