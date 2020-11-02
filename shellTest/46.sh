#!/bin/bash

# Description:
# 判断用户输入的是数字，字母或者其他

read -p "请输入一个字符：" temp
case "$temp" in
	[a-z]|[A-Z])
		echo "输入的是字母"
		;;
	[0-9])
		echo "输入的是数字"
		;;
	*)
		echo "输入的是除了字母数字其他的字符"
esac 
