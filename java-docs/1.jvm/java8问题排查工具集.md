#### jdk8工具集  
https://docs.oracle.com/javase/8/docs/technotes/tools/unix/index.html  
Troubleshooting  
https://docs.oracle.com/javase/8/docs/technotes/guides/troubleshoot/  



#### jps
https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jps.html  
**作用**
列出目标系统上的已检测Java虚拟机（JVM）
##### 命令格式
jps [ options ] [ hostid ]  
执行 jps -options命令后各个选项，见下面 

| **选项** | **描述** |
| --- | --- |
| -q	|不显示类名称，JAR文件名和传递给main方法的参数的输出，仅生成pid。|
|-m	|显示传递给main方法的参数|
|-l	|显示应用程序主类的全限定性名或应用程序JAR文件的完整路径名称。|
|-v	|显示传递给JVM的参数|
|-V	|仅显示pid和jar文件名称|



#### jinfo
https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jinfo.html
##### 作用
查看Java进程的配置信息
##### 命令格式
````shell script
Usage:
    jinfo [option] <pid>
        (to connect to running process)
    jinfo [option] <executable <core>
        (to connect to a core file)
    jinfo [option] [server_id@]<remote server IP or hostname>
        (to connect to remote debug server)

where <option> is one of:
    -flag <name>         to print the value of the named VM flag
    -flag [+|-]<name>    to enable or disable the named VM flag
    -flag <name>=<value> to set the named VM flag to the given value
    -flags               to print VM flags
    -sysprops            to print Java system properties
    <no option>          to print both of the above
-h | -help           to print this help message
````

#### jstat
https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jstat.html

#####作用

##### 命令格式
````shell script
Usage: jstat -help|-options
       jstat -<option> [-t] [-h<lines>] <vmid> [<interval> [<count>]]
````

执行 jstat -options命令后各个选项，见下面

|选项	|描述|
| --- | --- |
|-class	|类加载行为的统计信息|
|-compiler	|即时编译热点行为的统计|
|-gc	|堆行为的统计|
|-gcutil	|和GC一样，但输出主要关注已使用空间占总空间的百分比|
|-gccapacity	|Java堆各个区域使用到的最大和最小空间|
|-gccause	|垃圾回收统计信息 (和 gcutil 相同) , 最后和当前 垃圾回收事件|
|-gcmetacapacity	|输出永久代使用到的最大和最小空间|
|-gcnew	|新生代的统计|
|-gcnewcapacity	|同上，顺带输出主要关注使用到的最大和最小空间|
|-gcold	|年老代和永生代行为统计|
|-gcoldcapacity	|年老代行为统计|
|-printcompilation	|输出已经被JIT编译的方法|
outputOptions:  
一个或多个输出选项, 包括单个 stat选项, 加上任何-t、h 和 J 选项  
vmid:  
虚拟机标识符 进程id  
interval:  
采样间隔在指定的单位，秒（s）或毫秒（ms）。默认单位是毫秒。必须是正整数。如果指定，JSTAT将在每个间隔产生其输出  
count:  
显示的次数。默认值是无穷大；也就是说，JSTAT显示统计数据，直到目标JVM终止或JSTAT命令终止。必须是正整数  

##### 案例
1.查看pid垃圾回收情况：  jstat  -gc  pid  5000（时间间隔）



#### jmap：
https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jmap.html
##### 作用
打印进程，核心文件或远程调试服务器的共享对象内存映射或堆内存详细信息。
##### 格式
````shell script
Usage:
    jmap [option] <pid>
        (to connect to running process)
    jmap [option] <executable <core>
        (to connect to a core file)
    jmap [option] [server_id@]<remote server IP or hostname>
        (to connect to remote debug server)
````
参数：
•	option： 选项参数。  
•	pid： 需要打印配置信息的进程ID。  
•	executable： 产生核心dump的Java可执行文件。  
•	core： 需要打印配置信息的核心文件。  
•	server-id 可选的唯一id，如果相同的远程主机上运行了多台调试服务器，用此选项参数标识服务器。  
•	remote server IP or hostname 远程调试服务器的IP地址或主机名。  
option  
•	no option： 查看进程的内存映像信息,类似 Solaris pmap 命令。  
•	heap： 显示Java堆详细信息  
•	histo[:live]： 显示堆中对象的统计信息  
•	clstats：打印类加载器信息  
•	finalizerinfo： 显示在F-Queue队列等待Finalizer线程执行finalizer方法的对象  
•	dump:<dump-options>：生成堆转储快照  
•	F： 当-dump没有响应时，使用-dump或者-histo参数. 在这个模式下,live子参数无效.  
•	help：打印帮助信息  
•	J<flag>：指定传递给运行jmap的JVM的参数  



#### mat:
http://www.eclipse.org/mat/downloads.php

mat常用于分析dump文件

#### jstack：
https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jstack.html
##### 作用
打印Java进程，核心文件或远程调试服务器的Java线程堆栈跟踪。
##### 命令格式
````shell script
Usage:
    jstack [-l] <pid>
        (to connect to running process)
    jstack -F [-m] [-l] <pid>
        (to connect to a hung process)
    jstack [-m] [-l] <executable> <core>
        (to connect to a core file)
    jstack [-m] [-l] [server_id@]<remote server IP or hostname>
        (to connect to a remote debug server)
````
常用参数说明  
1）options：   
executable Java executable from which the core dump was produced.(可能是产生core dump的java可执行程序)  
core 将被打印信息的core dump文件  
remote-hostname-or-IP 远程debug服务的主机名或ip  
server-id 唯一id,假如一台主机上多个远程debug服务   
2）基本参数：  
-F  当’jstack [-l] pid’没有相应的时候强制打印栈信息,如果直接jstack无响应时，用于强制jstack），一般情况不需要使用  
-l  长列表. 打印关于锁的附加信息,例如属于java.util.concurrent的ownable synchronizers列表，会使得JVM停顿得长久得多（可能会差很多倍，比如普通的jstack可能几毫秒和一次GC没区别，加了-l 就是近一秒的时间），-l 建议不要用。一般情况不需要使用  
-m  打印java和native c/c++框架的所有栈信息.可以打印JVM的堆栈,显示上Native的栈帧，一般应用排查不需要使用  
-h | -help  打印帮助信息  
pid   需要被打印配置信息的java进程id,可以用jps查询.  

##### 案例
jstack查看输出
````shell script
jstack –l pid
````
jstack统计线程数
````shell script
jstack -l pid| grep 'java.lang.Thread.State' | wc –l
````