#!/bin/bash

#使用死循环实时显示eth0网卡发送的数据包流量

while :
do 
	echo '本地网卡 eth0 流量如下：'
	echo '接收：' `ifconfig eth0 | grep "RX pack" | awk '{print $5}'`
	echo '发送：' `ifconfig eth0 | grep "TX pack" | awk '{print $5}'`
	sleep 1
done
