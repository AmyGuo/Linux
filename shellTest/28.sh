#!/bin/bash

# Description:
# 本脚本每两五秒检测一次mysql并发连接数，可以将本脚本设置为开机启动脚本，或在特定时间执行

log_file=/var/log/mysql_count.log
user=root
passwd=123456
sudo touch $log_file
sudo chmod 776 $log_file
while :
do
	sleep 5;
	count=`mysqladmin -u$user -p$passwd status | awk '{print $4}'`
 	echo "`date +%Y-%m-%d` 并发连接数为：$count"  >> $log_file
done
