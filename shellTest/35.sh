#!/bin/bash

# Description:
# 生成随机密码

#1、这种方法使用SHA算法来加密日期，并输出结果的前32个字符：
echo "1:"
date +%s | sha256sum | base64 | head -c 32 ; echo

#2、这种方法使用内嵌的/dev/urandom，并过滤掉那些日常不怎么使用的字符。这里也只输出结果的前32个字符：
echo "2:"
< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;

#3、 这种方法使用openssl的随机函数。如果你的系统也许没有安装openssl，你可以尝试其它九种方法或自己安装openssl。
echo "3:"
openssl rand -base64 32

#4、 这种方法类似于之前的urandom，但它是反向工作的。Bash的功能是非常强大的！
echo "4:"
tr -cd '[:alnum:]' < /dev/urandom | fold -w30 | head -n1

#5、 这是使用urandom的一个更简单的版本：
echo "5:"
< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c6;echo

#6、 这种方法使用非常有用的dd命令：
echo "6:"
dd if=/dev/urandom bs=1 count=32 2>/dev/null | base64 -w 0 | rev | cut -b 2- | rev

#7、 你甚至可以生成一个只用左手便可以输入的密码：
echo "7:"
< /dev/urandom tr -dc '12345!@#$%qwertQWERTasdfgASDFGzxcvbZXCVB' | head -c8; echo ""

#8. 最后这种生成随机密码的方法是最简单的。它同样也可以在安装了Cygwin的Windows下面运行。在Mac OS X下或许也可以运行。我敢肯定会有人抱怨这种方法生成的密码没有其它方法来的随机。但实际上如果你使用它生成的全部字符串作为密码，那这个密码就足够随机了。
echo "8:"
date | md5sum
date | md5sum | awk '{print $1}'



 
