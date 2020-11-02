#!/bin/bash

# Description:
# 检测mysql服务是否存活

host=localhost
user=root
passwd=123456
mysqladmin -h$host -u$user -p$passwd ping &>/dev/null  
if [ $? -eq 0 ];then
	echo "mysql is up"
else
	echo "mysql is down"
fi
