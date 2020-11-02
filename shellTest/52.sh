#!/bin/bash

# Description:
# 使用egrep过滤mac地址

egrep "[0-9a-zA-Z]{2}(:[0-9a-zA-Z]{2}){5}" $1 
