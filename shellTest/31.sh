#!/bin/bash

# Description:
# 将文件中的所有小写字母转换为大写字母，脚本指定一个参数为文件名

tr "[a-z]" "[A-Z]" <  $1
