#!/bin/bash

#检测本机当前用户是否是超级管理员

if [ $USER == 'root' ];then
	echo 'you are root'
else 
	echo 'you are' $USER
fi
