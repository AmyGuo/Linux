#!/bin/bash

#统计16:30到17:30之间的请求数

cat debug-default-2020-09-18.log | grep -a "请求执行的方法" | awk '{print $2}' | awk -F ':' '$1":"$2>="16:30" && $1":"$2<="17:30"' | wc -l

