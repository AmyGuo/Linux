#!/bin/bash

#编写脚本，显示进度条
jindu(){
while :
do
	echo -n '#'
	sleep 0.2
done
}

jindu & 
cp -a $1 $2
#killall $0
sleep 1
echo '拷贝完成'
`ps -ef |grep $0 |grep -v grep | awk '{print $2}' | xargs kill -9`
