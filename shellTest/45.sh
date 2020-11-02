#!/bin/bash

# Description:
# 从键盘读取一个积分,判断论坛用户等级
# 等级分类如下:
# 大于等于90 神功绝世
# 大于等于80,小于90 登峰造极
# 大于等于70 炉火纯青
# 大于等于60 略有小成
# 小于60 初学乍练

read -p "请输入你的积分(0-100)：" jf
if [ $jf -gt 90 ];then
	echo "分数：$jf, 神功绝世"
elif [ $jf -gt 80 ];then
	echo "分数：$jf, 登峰造极"
elif [ $jf -gt 70 ];then
	echo "分数：$jf, 炉火纯青"
elif [ $jf -gt 60  ];then
	echo "分数：$jf, 略有小成"
else 
	echo "分数：$jf, 初学乍练"
fi
