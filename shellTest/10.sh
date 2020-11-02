#!/bin/bash

#编写脚本测试192.168.56.0/24 整个网段中哪些主机处于开机状态，哪些主机处于关机状态

#for
#for i in {1..254}
#do
#	每隔0.3sping一下，每次ping2次，设置1毫秒为超时时间
#	ping -c 2 -i 0.3 -W 1 192.168.56.$i &> /dev/null
#	if [ $? -eq 0 ];then
#		echo "192.168.56.$i is up"
#	else
#		echo "192.168.56.$i is down"
#	fi
#done

#while
#i=1
#while [ $i -le 254 ]
#do
#	ping -c 2 -i 0.3 -W 1 192.168.56.$i &> /dev/null
#       	if [ $? -eq 0 ];then
#               echo "192.168.56.$i is up"
#       	else
#               echo "192.168.56.$i is down"
#       	fi
#	let i++
#done


#多进程版本
#定义一个函数,ping 某一台主机,并检测主机的存活状态
myping(){
ping -c 2 -i 0.3 -W 1 $1  &>/dev/null
if  [ $? -eq 0 ];then
	echo "$1 is up"
else
	echo "$1 is down"
fi
}
for i in {1..254}
do
   	myping 192.168.56.$i &
done
# 使用&符号,将执行的函数放入后台执行
# 这样做的好处是不需要等待ping第一台主机的回应,就可以继续并发ping第二台主机,依次类推
