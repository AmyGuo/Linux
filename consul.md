#### consul的使用

部署集群中出现的问题：
1. 重新加载快照文件失败，三个子节点两个版本是1.2.2，一个是1.3.3,出现版本不兼容问题
```
出现的日志显示：
[ERR] raft: Failed to install snapshot 15-803021-1605856689276: failed to restore snapshot 15-803021-1605857360714: Unrecognized msg type 15
    2020/11/20 15:29:20 [ERR] raft: Failed to send snapshot to {Nonvoter 0fcf17d0-b685-b393-2a2e-d3321376a2f7 192.168.203.21:8300}: failed to restore snapshot 15-803021-1605857360714: Unrecognized msg type 15
    2020/11/20 15:29:22 [WARN] consul: error getting server health from "LOCAL-192-168-81-15": last request still outstanding

查看版本：
[AmyGuo@LOCAL-192-168-81-14 log]$ consul members
Node                           Address              Status  Type    Build  Protocol  DC             Segment
LOCAL-192-168-81-14.boyaa.com  192.168.81.14:8301   alive   server  1.3.3  2         config-center  <all>
LOCAL-192-168-81-15            192.168.81.15:8301   alive   server  1.2.2  2         config-center  <all>
VM-203-21                      192.168.203.21:8301  alive   server  1.2.2  2         config-center  <all>

```
2. 一个节点停止服务后，再次启动会失败，删除data目录下的文件，再次启动则会成功
3. consul中参加leader选举的只能是server模式，client模式只负责转发请求，所以server节点个数最好是3或者是5个，client节点可有可无
