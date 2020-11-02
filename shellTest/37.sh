#!/bin/bash

# Description:
# 显示当前计算机中所有账户的用户名称

#1.
awk -F ':' '{print $1}' /etc/passwd 

#2. 使用cut分隔冒号后面的内容
cut -d: -f1 /etc/passwd

#3. 将冒号后面的内容替换为空
sed 's/:.*//' /etc/passwd
