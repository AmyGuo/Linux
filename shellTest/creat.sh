#!/bin/bash

# 自动为其他脚本添加解释器信息#!/bin/bash ，如脚本名为test.sh则效果如下：
# ./test.sh abc.sh 自动为abc.sh 添加解释器信息
# ./test.sh user.sh 自动诶user.sh添加解释器信息

touch $1
# -e 的目的是为了让换行符\n生效
echo -e "#!/bin/bash\n" > $1
echo "# Description:" >> $1
echo "# " >> $1
chmod 744 $1

# 使用vim打开文件，并将光标跳转到第三行
vim +4 $1
