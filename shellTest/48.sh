#!/bin/bash

# Description:
# 显示本机linux系统上所有开放的端口列表

ss -nutpl | awk '{print $1,$5}' | awk  -F "[: ]" '{print "协议："$1,"端口号："$NF}'  | grep "[0-9]"  | uniq 
