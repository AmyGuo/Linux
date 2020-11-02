#!/bin/bash

#查看有多少远程的ip在链接本机

netstat -ant | grep "tcp" | awk '{print $5}' | sort | uniq -c | sort -nr

