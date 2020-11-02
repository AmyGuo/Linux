#!/bin/bash

# Description:
# 将linux系统中uid大于等于1000的普通用户都删除

user=$(awk -F: '{if($3>1000){print $1}}' /etc/passwd) 
for i in $user
do
	echo $i
	userdel -r $i
done
