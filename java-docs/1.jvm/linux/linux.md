#### 1.nohup启动java服务，追加日志文件导致磁盘占用，建议修改为以下写法:
````shell script
nohup /usr/java/jdk1.8.0_131/bin/java -Xms2048m -Xmx2048m -XX:MetaspaceSize=1024m                                                                                   
-XX:MaxMetaspaceSize=1024m -XX:+HeapDumpOnOutOfMemoryError -XX:+UseG1GC -verbose:gc 
-Xloggc:/log/gc.log -XX:+PrintGCDetails -XX:+PrintGCDateStamps -jar xxx-example.jar 
--spring.profiles.active=prd ./program >/dev/null 2>&1 &
````
将日志文件输出到黑洞目录，不指定输出日志文件

#### 2.日志技巧
- 查看文件,并显示行号 less -N catalina.out

- 定位到某行（这里定位到第10行） less +10g catalina.out

- 根据内容过滤显示,并显示行号  less 文件名 | grep -n 查找内容

- 输出包含匹配字符串的行数 -n，从 1 开始 grep -n ‘hello word’  catalina.out

- 统计包含匹配字符串的总行数  grep -c ‘hello world’ catalina.txt

- 输出包含匹配字符串的前后10行 grep -C10 ‘hello world’ catalina.txt | less -N

#### 3.less命令
|命令|解释
|----|----|
|less 文件名 |查看文件  
|less 文件名 &#124; grep -n 查找内容|根据文件过滤并显示行号
|less +行号g 文件名| 查看文件并定位到某行
|d|向下翻页
|u|向上翻页
|g|跳到首行
|G|跳到底部
|?查找内容|向上查找
|/查找内容|向下查找
|n|下一个
|N|上一个
|q|退出less命令

