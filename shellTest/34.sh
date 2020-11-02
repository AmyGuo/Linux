#!/bin/bash

# Description:
# 删除某个目录下的大小为0的文件

#dir="/var/www/html" 
dir=$1
find $dir -type f -size 0 -exec rm -f {} \;
