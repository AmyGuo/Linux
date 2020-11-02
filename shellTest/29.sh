#!/bin/bash

# Description:
# 根据md5校验码来检测文件是否被修改
# 本脚本在目标数据没有被修改前执行一次，当怀疑数据被人篡改后，再执行一次，两次执行的结果做对比，md5发生变化即文件被修改

for i in $(ls ./*.sh)
do
	md5sum $i >> ./test.log

done

# cat test.log | sort | uniq -u 获取未重复的数据，即发生改变的文件
