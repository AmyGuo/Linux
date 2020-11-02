#!/bin/bash

#统计当前linux系统可以登录计算机的账户有多少个

grep "bash$" /etc/passwd | wc -l

cat /etc/passwd | awk -F ':' '/bash$/{x++}END{print x}'
