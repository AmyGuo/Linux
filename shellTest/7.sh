#!/bin/bash

# 编写脚本:提示用户输入用户名和密码,脚本自动创建相应的账户及配置密码,如果用户没有输入用户名,则提示必须输入,并退出脚本,如果用户没有输入密码,则统一使用默认的密码123456

read -p "请输入要创建的用户名：" user


#使用-z可以判断一个变量是否为空，使用$?查看返回码2
if [ -z "$user" ];then
	echo '必须输入用户名'
	exit 2
fi

#使用stty -echo 关闭shell的回显功能，使用stty echo 打开shell的回显功能
stty -echo
read -p "请输入密码：" pass
stty echo
#当变量pass为null或者空字符是pass=123456
pass=${pass:-123456}
useradd $user
echo $pass | passwd --stdin $user


