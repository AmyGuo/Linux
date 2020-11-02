#!/bin/bash

# Description:
# 统计 /etc/passwd中出现root的次数

awk -F: '{i=1;while(i<=NF){if($i~/root/){x++};i++}}END{print "root出现次数为"x}' /etc/passwd

# grep -c "root"  /etc/passwd 只能统计行数
