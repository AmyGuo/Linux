#!/bin/bash

#猜数字游戏，脚本生成一个100以内的随机数，提示用户猜数字，根据用户的输入，提示用户是猜对了还是猜大了、猜小了，直至用户猜对

# RANDOM 为系统自带的系统变量，值为0-32767的随机数，使用取余变为1-100的数
num=$[RANDOM%100+1]
while :
do 
# stty erase '^H' 解决不能输入回退键的bug
	`stty erase '^H'` read -p "计算机生成了一个1-100的随机数，你猜：" cai
	if [ $cai -eq $num ];then
		echo "恭喜，猜对了"
		exit
	elif [ $cai -lt $num ];then
		echo "Oops，猜小了" 
	elif [ $cai -gt $num ];then
		echo "Oops,猜大了"
	fi

done

