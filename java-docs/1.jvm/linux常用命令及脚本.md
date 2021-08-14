## 01、查看服务内存资源占用
````shell script
ps -eo pmem,pcpu,rss,vsize,args | sort -k 1 -r | less
````
## 02、停止Java进程脚本
````shell script
path=/opt/project/app/app-web-1.0-SNAPSHOT.jar
pid=`ps -ef|grep $path|grep -v grep|awk '{print $2}'`
if [ -z "$pid" ]; then
    echo "No server running..."
    exit -1;
fi
echo "the server (${pid} is running...)"
kill $pid
echo "send shutdown request to server (${pid}) OK"
````

## 03、启动Java进程脚本
````shell script
nohup /usr/local/jdk1.8.0_181/bin/java -jar \
-Xmx1024m -Xmx1024m -XX:MetaspaceSize=512m -XX:MaxMetaspaceSize=512m \
-Dspring.profiles.active=prd \
-Dlogging.file=./logs/app-web.log /opt/project/app/app-web-1.0-SNAPSHOT.jar \
 >/dev/null 2>&1 &
````

## 04.清理超过7天的日志文件脚本
````shell script
count=`find /opt/project -mtime +7 -name "*.log.*.gz" | wc -l`
echo "del log file num is: " $count
find /opt/project -mtime +7 -name "*.log.*.gz" -exec rm -rf {} \;
````

## 05.GC日志 最佳实践-完整参数(芋道源码)
````shell script
## 必备
-XX:+PrintGCDetails
-XX:+PrintGCDateStamps
-XX:+PrintTenuringDistribution
-XX:+PrintHeapAtGC
-XX:+PrintReferenceGC
-XX:+PrintGCApplicationStoppedTime

## 可选
-XX:+PrintSafepointStatistics
-XX:PrintSafepointStatisticsCount=1

## GC日志输出的文件路径
-Xloggc:/path/to/gc-%t.log
## 开启日志文件分割
-XX:+UseGCLogFileRotation
## 最多分割几个文件，超过之后从头文件开始写
-XX:NumberOfGCLogFiles=14
## 每个文件上限大小，超过就触发分割
-XX:GCLogFileSize=100M
````