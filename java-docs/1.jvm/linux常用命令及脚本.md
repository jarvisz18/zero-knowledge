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