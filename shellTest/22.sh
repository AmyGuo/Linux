#!/bin/bash

#统计客户端访问各个接口的次数

cat debug-default-2020-09-18.log | grep -a "proxy for rpcName" | awk -F 'proxy for rpcName = ' '{print $2}' | awk '{name[$1]++}END{for(i in name){print name[i],i}}' | sort -nr
