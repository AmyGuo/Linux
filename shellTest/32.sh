#!/bin/bash

# Description:
# 显示cpu厂商信息
awk '/vendor_id/{print $3}' /proc/cpuinfo | uniq 
