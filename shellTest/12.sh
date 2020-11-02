#!/bin/bash

# 编写脚本，显示进度条

routate_line(){
interval=0.5
count=0
while :
do
	((count++))
	#echo $count
	case $count in 
	1)
		echo -e '-'"\b\c"
		sleep $interval
		;;
	2)
		echo -e '\\'"\b\c"
		sleep $interval
		;;

	3)
		echo -e '|'"\b\c"
		sleep $interval
		;;

	4)
		echo -e '/'"\b\c"
		sleep $interval
		;;

	*)
		count=0
		;;
	esac
done
}
routate_line
