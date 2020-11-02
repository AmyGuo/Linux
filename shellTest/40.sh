#!/bin/bash

# Description:
# 修改linux 系统的最大打开文件数量

cat >> /etc/security/limits.conf<<EOF
* soft nofile 65535
* hard nofile 65535
EOF 
