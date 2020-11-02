#!/bin/bash

#编写脚本，实现人机【石头，剪刀，布】的游戏
game=(石头 剪刀 布)
num=$[RANDOM%3]
computer=${game[$num]}
echo "请根据下列提示选择您的出拳手势："
echo "1. 石头"
echo "2. 剪刀"
echo "3. 布"

read -p "请输入1-3：" person
echo $computer
case $person in
1)
	echo "您出了石头"
	if [ $num -eq 0 ];then
		echo "平局"
	elif [ $num -eq 1 ];then
		echo "对方出了剪刀，您赢了"
	else 
		echo "对方出了布，您输了"
	fi
;;
2)
	echo "您出了剪刀"
	if [ $num -eq 0 ];then
		echo "对方出了石头，您输了"
	elif [ $num -eq 1 ];then
		echo "平局"
	else 
		echo "对方出了布，您赢了"
	fi
;;
3)
	echo "您出了布"
	if [ $num -eq 0 ];then
		echo "对方出了石头，您赢了"
	elif [ $num -eq 1 ];then
		echo "对方出了剪刀，您输了"
	else 
		echo "平局"
	fi
;;
*)
	echo "必须输入1-3之间的数字"
esac

