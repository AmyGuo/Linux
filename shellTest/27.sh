#mkdir /data/scripts
#vim /data/scripts/nginx_log.sh

#!/bin/bash

# Description: 切割nginx日志文件(防止单个文件过大，后期处理很困难)
logs_path="/usr/local/nginx/logs/"
mv ${logs_path}access.log ${logs_path}access_$(date -d "yesterday" +"%Y%m%d").log
# nginx 监听usr1信号用来分隔日志
kill -SIGUSR1 `cat /usr/local/nginx/logs/nginx.pid`

# chmod +x /data/scripts/nginx_log.sh
# crontab -e 脚本编写完后，将脚本放入计划任务中每天执行一次脚本
# 0 1 * * * /data/scripts/nginx_log.sh
