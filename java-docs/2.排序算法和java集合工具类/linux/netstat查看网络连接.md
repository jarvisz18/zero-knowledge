## netstat查看网络连接
**netstat**是 DOS 命令,是一个监控TCP/IP网络的非常有用的工具，它可以显示路由表、  
实际的网络连接以及每一个网络接口设备的状态信息.Netstat用于显示与IP、  
TCP、UDP和ICMP协议相关的统计数据，一般用于检验本机各端口的网络连接情况。

#### 1.先看一个命令
````shell script
netstat -na | grep -i time_wait | wc -l
````
netstat-na  
/ -n  打印实际地址，而不是对地址的解释或者显示主机，网络名之类的符号，就是以数字方式来显示。  
/ -a  显示所有套接字的状态。   
状态列表:  
LISTEN ：在监听状态中。  
ESTABLISHED：已建立联机的联机情况。  
TIME_WAIT：该联机在目前已经是等待的状态。  
参考链接：https://blog.csdn.net/qfikh/article/details/80530340