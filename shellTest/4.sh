#!/bin/bash

#实时监控本机内存和硬盘剩余空间，剩余内存小于500M，根分区剩余空间小于1000M时，发送报警邮件给root管理员

#提取根分区剩余空间
disk_size=$(df / | awk '/\//{print $4}')

#提取内存剩余空间
mem_size=$(free | awk '/Mem/{print $4}')

while :
do
if [ $disk_size -le 512000 -o $mem_size -le 3310485 ];then
 	mail -s "Warning" root <<EOF
	Insufficient resources,资源不足
EOF
sleep 1
fi
done

