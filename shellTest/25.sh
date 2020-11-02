#!/bin/bash

# Description:
#编写nginx启动脚本
#本脚本编写完成后，放在/etc/init.d/目录下，就可以被linux系统自动识别到改脚本，如果本脚本名为/etc/init.d/nginx,则
#service nginx start|stop|restart|status 可以操作改服务

program=/usr/local/nginx/sbin/nginx
pid=/usr/local/nginx/logs/nginx.pid

start(){
	if [ -f $pid ];then
		echo "nginx 服务已经处于开启状态"
	else
		$program
	fi
}

stop(){
	if [ ! -f $pid ];then
		echo "nginx 服务已关闭"
	else 
		$program -s stop
		echo "关闭服务 ok"
	fi
}

status(){
	if [ -f $pid ];then
		echo "服务正在运行"
	else
		echo "服务已关闭"
	fi
}

case $1 in
start)
	start;;
stop) 
	stop;;
restart)
	stop
	sleep 1
	start;;
status)
	status;;
*)
	echo "你输入的语法格式错误"
esac


