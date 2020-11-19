 ### linux经典面试题

> 网络相关：

1. 简述iso/osi的七层模型和每一层的作用

   应用层--表示层--会话层--传输层--网络层--数据链路层--物理层

   应用层：为用户提供服务，给用户一个操作界面

   表示层：数据提供表示，加密，压缩

   会话层：确定数据是否需要进行网络传递

   传输层：1. 对报名进行分组（发送时）、组装（接收时） 2. 提供传输协议的选择（tcp-传输控制协议-可靠的面向连接的传输协议-可靠准确但是慢,udp-用户数据报协议-不可靠的面向无连接的传输协议-快但不可靠）3. 端口封装 4. 差错校验

   网络层 ：1. IP地址编址 2. 路由选择（静态路由，动态路由）

   数据链路层：1. mac地址编址  2. mac地址寻址 3. 差错校验

   物理层：1. 数据实际的传输 2. 电气特性定义

2. tpc/ip五层模型和作用，tcp协议和udp协议工作在哪一层，作用是什么

   应用层--传输层--网络层--数据链路层--网络层，tcp，udp工作在传输层。

   应用层：HTTP,FTP,SMTP,SNMP,DNS
   传输层：TCP，UDP

   网络层：ICMP，IP，IGMP，ARP，RARP

3. 简述tcp三次握手的过程

   第一次握手：client将标志位SYN设置为1，随机产生一个值为seq=J,并将该数据发送给Server，client进入SYN_SENT状态，等待server确认

   第二次握手：server收到数据包后由SYN=1知道client请求建立连接，server将标志位SYN和ACK都置为1，ack序号J+1,随机产生seq=K,并将该数据发送给client以确认连接请求，server进入SYN_RCVD状态

   第三次握手：client收到确认后，检查ack序号是否为J+1，标志位ACK是否为1，如果正确则将标志位ACK置为1，ack序号=K+1,并将该数据包发送给server，server检查acl序号是否为K+1,ACK是否为1，如果正确则建立连接成功，client和server进入established状态，完成三次握手。随后两者之间可以开始传输数据了。
   
4. 简述四次挥手的过程

   第一次挥手：client发送一个标志为FIN包，seq序号为m,用来关闭client到server的数据传送，client进入FIN_WAIT1状态

   第二次挥手：server收到标志为FIN包之后，发送一个标志为ACK给client，ack确认序号为m+1，server进入CLOSE_WAIT状态

   第三次挥手：server发送标志为FIN=1，ACK=1，seq序号=n,ack确认好为m+1,用来关闭server到client的数据传送，server进入LAST_ACK状态

   第四次挥手：client收到FIN后，client进入TIME_WAIT状态，接着发送一个ACK标志给server，ack确认序号=n+1,server进入CLOSED状态，完成四次挥手。

5. 172.22.14.231/26，该ip位于那个网段，该网段拥有多少个可用IP地址，广播地址是什么？

   172.22.141.92--172.22.14.255

   可用ip:2^6-2

   广播地址:172.22.141.255 

6. ip地址的分类

   A类：0开头：1.0.0.0--126.255.255.255（127.0.0.1 回环ip）

   B类：10开头：128.0.0.0--191.255.255.255

   C类：110开头：192.0.0.0--223.255.255.255

   D类：1110开头：224.0.0.0--239.255.255.255(组播)

   E类：1111开头：240.0.0.0--255.255.255.255（保留）

   私有ip地址：(公司学校使用)

   A:10.0.0.0--10.255.255.255

   B:172.16.0.0--172.31.255.255

   C:192.168.0.0--192.168.255.255

   

> linux 权限相关

1. 简述linux权限划分原则

   注意权限分离（linux系统权限，数据库权限不要掌握在同意部门）

   权限在满足使用情况下，最小优先

   减少使用root用户，尽量使用普通用户+sudo提权进行日常操作

   重要系统文件，如/etc/passed /etc/shadow /etc/fstab /etc/sudoers等日常建议使用chattr锁定，需要操作时再打开

   使用脚本检测系统中新增的SUID、SGID文件

   开启ssh服务密钥对登录，修改ssh使用端口

> 备份策略

1. 如果一个系统没有任何的备份策略，请写出一个较为全面合理的备份方案

   备份策略：

   完整备份：cp,tar,dump,xfsdump

   增量备份：每次备份以前一次备份作为参照 dump,xfsdump

   差异备份：每次备份以第一次备份作为参照dump,xfsdump

   备份频率：

   实时备份：如MySQL主从同步

   定时备份：脚本+定时任务实现

   备份存储位置：本地备份，异地备份（不要把鸡蛋放在同一篮子中）

   常见服务器的备份方案：

   每日备份的数据（异地备份）：mysql数据库，主从备份之外，增量备份一次

   每周备份的数据（异地备份）：MySQL数据库（完整备份）；重要系统数据；网页数据；其他服务相关数据；日志等

2. 网站服务器每天产生的日志数量较大，请问如何备份？

   日志的切割和轮替（系统日志管理工具--logrotate）

> Raid

1. 简述Raid0,Raid1,Raid5的特点和原理

   raid0(独立磁盘冗余阵列):必须使用两块及两块以上的硬盘组成；每块硬盘的大小必须一致；时所有动态磁盘中，数据读写最快的；损坏纪律相对最高；没有磁盘容错功能；

   raid1:由两块或者2的倍数硬盘组成；每块硬盘大小必须一致；硬盘使用率只有50%，写入速度最慢；拥有磁盘容错功能；

   raid5:由三块或以上硬盘组成；每块硬盘大小必须一致；磁盘利用率时n-1块盘；利用奇偶校验，拥有磁盘容错功能（只支持1块硬盘损坏）

   
> shell编程类

1. 有一个b.txt文本，要求将所有域名截取出来并统计重复域名出现次数

   http://www.baidu.com/index.html

   http://www.aa.com/index.html

   http://www.bb.com/index.html

   http://www.baidu.com/index.html

   cat b.txt | cut -d "/" -f 3 | sort | uniq  -c | sort -nr

   2 www.baidu.com

   1 www.aa.com

   1 www.bb.com

2. 统计当前服务器正在连接的IP地址，并按照连接次数排序

   netstat -an | grep "ESTABLISHED" | awk '{print $5}' | cut -d ":" -f 1 | sort -n | uniq -c | sort -nr

3. 使用循环在/test目录下创建10个txt文件，要求文件名称由6位随机小写字母数字加固定字符串组成（_gg），例如：pzjefg_gg.txt

   ```
   #!/bin/bash
   
   if [ !d /test ];then
   
   ​	mkdir /test
   
   fi
   
   cd /test
   
   for ((i=1;i<=10;i++))
   
   do
   
   ​	filename=$(tr -dc 'A-Za-z0-9' < /dev/urandom | head -c 6)
   
   ​	touch "$filename"_gg.txt
   
   done
   ```

4. 生成随机数

   echo $RANDOM 0-32767的数字

   echo $(($RANDOM%1000)) 1000以内的随机数

5. 批量检测多个网站是否可以正常访问，要求使用shell数组实现，检测策略尽量模拟用户真实访问模式

   http://www.test.com  http://www.baidu.com  http://www.aaa.com

   ```
   #!/bin/bash
   
   web={
   
   http://www.test.com
   
   http://www.baidu.com  
   
   http://www.aaa.com
   
   }
   
   for i in ${web[*]}
   
   do
   
   code=$(curl -o /dev/null -s --connect-timeout 5 -w '%{http_code}' $i | grep -E "200|302")
   
   if [ "$code"!= "" ];then
   
   ​	echo "$i is ok" >> /root/ok.log
   
   else
   
   ​	sleep 10
   
   ​	code=$(curl -o /dev/null -s --connect-timeout 5 -w '%{http_code}' $i | grep -E "200|302")
   
   ​	if [ "$code"!= "" ];then
   
   ​		echo "$i is ok" >> /root/ok.log
   
   ​	else
   
   ​		echo "$i is error" >> /root/error.log
   
   ​	fi
   
   fi
   
   done
   ```
> linux网络服务相关

1. 哪些设置能够提高ssh远程管理的安全等级

   以下五种：

   ssh的登录验证方式（口令+密钥）

   ssh的登录端口和监听设置（/etc/ssh/sshd_config 改变默认端口22，只允许内网进行连接）

   ssh的登录用户限制 ( /etc/ssh/sshd_config: PermitRootLogin no  远程登录不允许root登录[如果需要root，可先用普通用户登录再切换用户])

   ssh的登录超时设置 （/etc/profile  export TMOUT=300 [设置客户端5分钟无操作自动断开连接] ） 

   ssh登录失败尝试次数  （/etc/ssh/sshd_config  MaxAuthTries 6 [设置客户端登录失败尝试次数为6次]）

   ```
   ssh登录验证方式--口令登录：
   1. 客户端向服务端发起ssh请求
   2. 服务端收到亲求，发送公钥给客户端
   3. 客户端输入用户名米啊通过公钥加密，回传给服务器
   4. 服务端通过私钥解密得到用户名密码和恩地进行对比，验证成功，允许登录，否侧再次验证。
   ssh登录验证方式--密钥登录：
   1. 首先在客户端上生成一对密钥
   2. 将公钥拷贝给服务段一份并命名为authorized_keys
   3. c向s发送一个连接请求，信息包括ip,用户名
   4. s得到c的信息后，会到authorized_keys查找，如果有相应的IP和用户名，s会随机生成一个字符串，如qwer
   5. s将使用公钥对字符串qwer进行加密，发送给c
   6. 得到s发来的消息后，c会使用私钥进行解密，将解密后的字符串发送给s
   7. 接收到解密后的字符串会跟先前生成的字符串进行对比，如果一致，就允许免密码登录
   ```

   答案：

   登录验证模式修改为密钥登录

   登录端口修改为非22端口以及指定监听IP

   禁止roo用户远程登录

   设置无操作时自动断开连接

   设置登录失败后尝试登录次数为6次

   编写防火墙规则，使用白名单机制放行ssh服务的监听端口

2. ssh连接时认证时间过长如何解决

   配置文件/etc/ssh/sshd_config：UseDns no [取消ssh登录时的dns反向解析请求功能]

3. scp和rsync进行远程给文件复制有什么区别

   scp:全量备份，文件及传输，加密传输，资源消耗低（基于ssh）

   rsync:差异对比，增量备份，分块校验，部分传输，非加密传输，资源消耗高（零散文件较多）

4. 请描述通过DHCP服务器获取IP地址的过程

   DHCP租约过程分为4步：

   客户机请求IP（客户机发DHCPDISCOVER广播包）

   服务器响应（服务器发DHCPOFFER广播包）

   客户机选择IP（客户机发DHCPREQUEST广播包）

   服务器确定租约（服务器发送DHCPACK/DHCPNAK广播包）

5. 集群环境中，如何保证所有服务器之间的时间误差较小

   手动测试同步：ntpdate 时间服务器IP地址

   自动同步：可以将命令写入计划任务

6. 请描述用户访问网站时DNS的解析过程

   客户机首先查看本地hosts文件是否有解析记录，有则直接用来访问web server
   
   没有则向网卡中记录的首选DNS（本地DNS）发起查询请求
   
   本地DNS若有记录则返回给客户端，客户端接收到后直接访问服务器
   
   若没有，则本地DNS向根域服务区发起请求，请求解析对应顶级域的IP地址
   
   本地DNS得到顶级域服务器IP后，再向顶级域服务区发起请求，请求解析权威NDS服务器的IP地址
   
   本地DNS服务器获得权威DNS服务器IP地址后，再向其查询具体的完整域名的对应解析记录
   
   最终本地DNS将查询到的对应域名的解析记录发送给客户端，并再本地记录一份

7. 解释权威DNS和递归DNS的含义，并描述智能DNS的实现原理

   权威DNS是经上一级授权对域名进行解析的DNS服务器，同时它可以把解析授权转授给其他服务器

   递归DNS负责接收用户对任何域名的查询，并返回结果给用户，它可以缓存结果避免用户再向上查询

   智能DNS就是将对用户发起的查询进行判断出是哪个运营商的用户查询，然后将请求转发给想用的运营商IP处理，减少跨运营访问的时间，提高访问速度

8. 公司里有一台服务器，需要在上面跑了两个网站，并且其中一个网站需要更换新域名，请问如何处理？网站1:www.a.com 网站2：www.b.com（旧）www.d.com(新)
   虚拟主机：基于IP的虚拟主机；基于IP+端口的虚拟主机；基于域名的虚拟主机

9. 简述apache的三种工作模式
   1. prefork模式：单进程单线程单独处理一个请求
   2. worker模式：一个子进程开启多个线程
   3. event模式：keepalive功能；分配管理线程

10. 请写出工作中常见的apache优化策略
    设置apache的日志轮替和切割规则，防止日志过大
    美化错误页面，将404，500等错误信息重定向到网页首页或者其他页面，提升用户体验 vim httpd.conf  ErrorDocument 404 www.a.com
    屏蔽apache版本等敏感信息，防止别人获取apache的相应版本
    配置静态缓存，减少对服务器的访问压力
    禁止解析指定目录下的页面程序，比如upload，禁止解析用户上传的脚本文件

11. apache和nginx各有什么优缺点，应该如何选择
    apache的优缺点：
    优点：
    1. apache的rewrite功能比nginx强大
    2. 模块非常多，基本想要的功能都能找到模块
    3. 存在时间较长，文献较全，bug相对较少
    4. 动静态解析都很稳定   
   
    缺点：
    ​	由于工作模式是同步阻塞型，导致资源消耗较高，并发能力较差 
    nginx的优缺点：
    优点：
    	1. 轻量级服务，比apache占用更少的内存及资源
     	2. 并发能力强，nginx处理请求时异步阻塞的，而apache则时阻塞型的，在高并发下nginx能保持资源低消耗高性能
     	3. 高度模块化的设计，编写模块相对简单
     	4. 社区活跃，各种高性能模块迅速产出
    缺点：
    ​	动态处理上需要使用fastcgi连接PHP的FPM服务，相比apache不占优势
    apache和nginx的选择：
    nginx适合静态处理，简单，高效
    apache适合做动态处理，稳定，功能强
    并发较高的情况下优先选择nginx，并发要求不高的情况下两者都可以，规模较大的可以使用nginx作为反向代理，然后动态请求负载到后端apache上。

12. 为什么nginx的并发能力强，资源消耗低
    nginx以异步非阻塞方式工作
    1. 客户端发送请求，服务器分配work进程来处理
    2. 能立即处理完的，处理完后work进程释放资源，进行下一个请i去
    3. 不能立刻处理完的work进程注册返回事件，然后接着去处理其他请求
    4. 当之前的请求结果返回后，触发返回事件，由空闲work进程接着处理
    5. 通过这种快速处理，快速释放请求的方式，达到同样的配置可以处理更大并发量的目的
