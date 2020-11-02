#!/bin/bash

#通过位置变量创建linux系统账户及密码

useradd "$1"
echo "$2" | passwd --stdin "$1"
