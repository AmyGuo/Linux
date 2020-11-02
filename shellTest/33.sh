#!/bin/bash

# Description:
# 查找linux系统中的僵尸进程

ps aux | awk '{if($8 == 'Z'){print $2,$11}}' 
