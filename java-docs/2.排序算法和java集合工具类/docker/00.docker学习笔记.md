# docker学习笔记
基础环境
(Linux环境为centos7.x)

## 1.	docker介绍
### 1.1.	docker简介
Docker 是一个开源的应用容器引擎，基于 Go 语言 并遵从Apache2.0协议开源。Docker 可以让开发者打包他们的应用以及依赖包到一个轻量级、可移植的容器中，然后发布到任何流行的 Linux 机器上，也可以实现虚拟化。
容器是完全使用沙箱机制，相互之间不会有任何接口（类似 iPhone 的 app）,更重要的是容器性能开销极低。

### 1.2.	docker的应用场景
- Web 应用的自动化打包和发布。
- 自动化测试和持续集成、发布。
- 在服务型环境中部署和调整数据库或其他的后台应用。
- 从头编译或者扩展现有的OpenShift或Cloud Foundry平台来搭建自己的PaaS环境。

### 1.3.	Docker 的优点
1、简化程序：
Docker 让开发者可以打包他们的应用以及依赖包到一个可移植的容器中，然后发布到任何流行的 Linux 机器上，便可以实现虚拟化。Docker改变了虚拟化的方式，使开发者可以直接将自己的成果放入Docker中进行管理。方便快捷已经是 Docker的最大优势，过去需要用数天乃至数周的 任务，在Docker容器的处理下，只需要数秒就能完成。

2、避免选择恐惧症：
如果你有选择恐惧症，还是资深患者。Docker 帮你 打包你的纠结！比如 Docker 镜像；Docker 镜像中包含了运行环境和配置，所以 Docker 可以简化部署多种应用实例工作。比如 Web 应用、后台应用、数据库应用、大数据应用比如 Hadoop 集群、消息队列等等都可以打包成一个镜像部署。

3、节省开支：
一方面，云计算时代到来，使开发者不必为了追求效果而配置高额的硬件，Docker 改变了高性能必然高价格的思维定势。Docker 与云的结合，让云空间得到更充分的利用。不仅解决了硬件管理的问题，也改变了虚拟化的方式。

### 1.4.	docker架构
+ Docker 使用客户端-服务器 (C/S) 架构模式，使用远程API来管理和创建Docker容器。
+ Docker 容器通过 Docker 镜像来创建。
+ 容器与镜像的关系类似于面向对象编程中的对象与类。

### 1.5.	docker基础概念
Docker|面向对象
---|---:
容器(images)|对象(instance)
镜像(container)|类(class)

1. docker镜像(images)  
docker镜像是用于创建 Docker 容器的模板。

2. docker容器(Container)  
容器是独立运行的一个或一组应用。

3. docker客户端(client)  
Docker 客户端通过命令行或者其他工具使用 Docker API与 Docker 的守护进程通信。

4. Docker 主机(Host)  
一个物理或者虚拟的机器用于执行 Docker 守护进程和容器。

5. Docker 仓库(Registry)  
Docker 仓库用来保存镜像，可以理解为代码控制中的代码仓库。

6. Docker Machine  
Docker Machine是一个简化Docker安装的命令行工具，通过一个简单的命令行即可在相应的平台上安装Docker，比如VirtualBox、 
Digital Ocean、Microsoft Azure。
## 2.	docker安装
### 2.1.	安装常用软件
yum -y install wget curl git make

### 2.2.	centos7.x下安装docker
Docker支持以下的CentOS版本：
CentOS 7 (64-bit)
CentOS 6.5 (64-bit) 或更高的版本

1).查看系统环境
[root@localhost ~]# uname -r
3.10.0-514.el7.x86_64

2)、确保 yum 包更新到最新。
yum update 

3).安装yum-utils管理yum源
yum install -y yum-utils device-mapper-persistent-data lvm2  
 
4).修改镜像源
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

5).安装docker
yum -y install docker-ce
卸载docker
yum -y remove docker

6).查看docker版本 
[root@localhost ~]# docker -v
Docker version 19.03.5, build 633a0ea

### 2.3.	Ubuntu Docker 安装
Docker 支持以下的 Ubuntu 版本：  
Ubuntu Precise 12.04 (LTS)  
Ubuntu Trusty 14.04 (LTS)  
Ubuntu Wily 15.10  
其他更新的版本……  

前提条件
Docker 要求 Ubuntu 系统的内核版本高于 3.10 
通过 uname -r 命令查看你当前的内核版本

使用脚本安装 Docker
1、获取最新版本的 Docker 安装包
wget -qO- https://get.docker.com/ | sh

安装完成后有个提示：
````
If you would like to use Docker as a non-root user, you should now consider
adding your user to the "docker" group with something like:
sudo usermod -aG docker edualiyun Remember that you will have to log out and back in for this to take effect!
````
当要以非root用户可以直接运行docker时，需要执行 sudo usermod -aG docker runoob 命令，然后重新登陆，否则会有如下报错

启动docker 后台服务
````
sudo service docker start
````

测试运行hello-world
````
docker run hello-world
````

### 2.4.	docker常用命令
查看docker的版本，包括客户端、服务端、依赖的Go等
````
docker version
````
查看系统层面信息，包括管理的images，containers数等
````
docker info
````
搜索镜像
````
docker search ubuntu
````
拉取镜像
````
docker pull search
````


+ 查看镜像历史：docker history 镜像ID/镜像tag
+ 创建容器：docker run -d --name=容器名称 镜像ID/镜像tag
+ 启动容器：docker start 容器名称/容器ID
+ 查看容器：docker ps
+ 重启容器：docker restart 容器名称/容器ID
+ 停止容器：docker stop 容器名称/容器ID
+ 删除容器：docker rm 容器名称/容器ID
+ 暂停容器：docker pause 容器名称/容器ID
+ 恢复容器：docker unpause 容器名称/容器ID
+ 执行命令：docker exec -ti 容器名称/容器ID /bin/bash
+ 获取容器日志：docker logs 容器名称/容器ID

- docker ps –a        可以观看到，当前容器是否为启动状态
- docker stop b0707b7b6900   关闭   start   开启  容器
- docker ps -a –q           查看当前容器
- docker rm b0707b7b6900     将当前容器删除
- docker rmi test/centos:v1.0        删除镜像


查看已经安装的docker
````
yum list installed | grep docker
````
````
启动 systemctl restart docker 
状态 systemctl status docker
开启自启 systemctl enable docker
````
验证docker是否安装成功
````
docker run hello-world
````
查看实时日志
````
docker logs -f -t --since="2017-05-31" --tail=10 edu_web_1
````
--since : 此参数指定了输出日志开始日期，即只输出指定日期之后的日志。  
-f : 查看实时日志  
-t : 查看日志产生的日期  
-tail=10 : 查看最后的10条日志。  
edu_web_1 : 容器名称  

run使用镜像创建容器
````
docker run ubuntu /bin/echo hello world
````
run创建容器，并交互式的运行
````
docker run  –i  –t  ubuntu  /bin/bash
````
当利用 docker run 来创建容器时，Docker 在后台运行的标准操作包括：  
检查本地是否存在指定的镜像，不存在就从公有仓库下载  
利用镜像创建并启动一个容器  
分配一个文件系统，并在只读的镜像层外面挂载一层可读写层  
从宿主主机配置的网桥接口中桥接一个虚拟接口到容器中去  
从地址池配置一个 ip 地址给容器  
执行用户指定的应用程序  
执行完毕后容器被终止  

run -d 守护态运行：  
更多的时候，需要让 Docker 容器在后台以守护态（Daemonized）形式运行。此时，可以通过添加 -d 参数来实现。
````  
docker run –d -it ubuntu /bin/echo hello world
````
attach 连接已经启动的容器 / start -i 启动并连接容器  
diff 命令查看容器内的文件变化  
它可以列出容器内发生变化的文件和目录。这些变化包括添加（A-add）、删除（D-delete）、修改（C-change） 
```` 
docker diff c43c7d102baa 
````
inspect 收集有关容器和镜像的底层信息  
Docker inspect命令可以收集有关容器和镜像的底层信息。这些信息包括：  
+ 容器实例的IP地址
+ 端口绑定列表
+ 特定端口映射的搜索
+ 收集配置的详细信息   
语法：docker inspect container/image  

kill 命令发送sigkill信号停止容器的主进程
````
docker kill [options] <container_id> 
````
rmi 移除一个或多个镜像
````
docker rmi <image_id>
#注意：在删除镜像之前要先用 docker rm 删掉依赖于这个镜像的所有容器
````
tag 修改镜像的标签
````
docker tag f59c7e5b1817 zwx/ub_mv:127
````
docker的导入和导出
将容器打包
````
docker export 11f589bdcf65 > /opt/web-test1.tar
````
打包镜像
````
docker save debian02 >/root/debian02.tar #debian02镜像打包
````
在另外的机器上导入镜像
````
docker load < debian02.tar #导入镜像
docker images #查看存在的镜像
````
## 3.	docker安装常见问题
### 3.1.	问题描述：net/http: TLS handshake timeout
````
[root@localhost ~]# docker search mysql
Error response from daemon: Get https://index.docker.io/v1/search?q=mysql&n=25: net/http: TLS handshake timeout
````
或者出现
````
[root@localhost system]# docker pull centos:7
Error response from daemon: Get https://registry-1.docker.io/v2/: net/http: request canceled while waiting for connection (Client.Timeout exceeded while awaiting headers)
````
修改加速器
````
vi /etc/docker/daemon.json
````
备注：insert 编辑内容如下      并esc  输入:wq 保存退出  
````
{
  "registry-mirrors": ["https://registry.docker-cn.com",
  "http://f1361db2.m.daocloud.io"
  "http://hub-mirror.c.163.com"]
}
````

备注：国内可用加速地址：
````
https://registry.docker-cn.com
http://hub-mirror.c.163.com
https://3laho3y3.mirror.aliyuncs.com
http://f1361db2.m.daocloud.io
https://mirror.ccs.tencentyun.com
````
### 3.2.	问题描述：no such host
````
Error response from daemon: Get https://index.docker.io/v1/search?q=mysql&n=25: proxyconnect tcp: dial tcp: lookup https on 8.8.8.8:53: no such host
````
查看index.docker.io主机，添加至host文件中
````
vi /etc/hosts
````
````
34.237.62.81    index.docker.io
````
### 3.3.	问题描述：lookup auth.docker.io on timeout
````
lookup auth.docker.io on 8.8.8.8:53: read udp 192.168.70.129:54794->8.8.8.8:53: i/o timeout
````
解决方案：
````
dig @114.114.114.114 registry-1.docker.io
-bash: dig: command not found
yum -y install bind-utils
````

将ip映射关系添加至/etc/hosts
````
52.202.253.107      registry-1.docker.io      
34.232.31.24      registry-1.docker.io      
52.201.142.14      registry-1.docker.io      
34.199.40.84      registry-1.docker.io      
34.205.88.205      registry-1.docker.io      
34.199.77.19      registry-1.docker.io      
34.201.196.144      registry-1.docker.io      
34.228.211.243      registry-1.docker.io  
````

````
Get https://registry-1.docker.io/v2/: net/http: TLS handshake timeout
````
3.docker配置加速器
````
vi /etc/docker/daemon.json
{
    "registry-mirrors": [
        "https://docker.mirrors.ustc.edu.cn",
        "https://registry.docker-cn.com",
        "http://hub-mirror.c.163.com",
        "https://1nj0zren.mirror.aliyuncs.com",
        "http://f1361db2.m.daocloud.io"
        ]
} 
````
````
sudo systemctl daemon-reload
sudo systemctl restart docker
````
查看是否生效
````
docker info
````
测速
````
time docker pull redis:latest
````

## 4.	常用镜像安装

docker pull centos:7
docker pull ubuntu
### 4.1.	使用mysql镜像
````
docker pull mysql:8.0
````
启动mysql容器
````
docker run -d --name mysql5.7 -p 3306:3306 mysql:5.7
````
设置自启动
````
docker run --name mysql5.7 --restart=always -e MYSQL_ROOT_PASSWORD=Inorise -p 3308:3306 -d mysql:5.7
````

进入mysql服务
````
docker exec -it 2d1230ee1d2c /bin/bash
````

### 4.2.	使用redis镜像
docker pull redis:latest
docker run -p 6379:6379 -v $PWD/data:/data  -d redis redis-server --appendonly yes
命令说明：
-p 6379:6379 :将容器的6379端口映射到主机的6379端口
-v $PWD/data:/data :将主机中当前目录下的data挂载到容器的/data
redis-server --appendonly yes :在容器执行redis-server启动命令，并打开redis持久化配置
````
docker run -d --name myredis -p 6379:6379 redis --requirepass "mypassword"
````
--requirepass 设置密码

连接、查看容器
使用redis镜像执行redis-cli命令连接到刚启动的容器,主机IP为172.17.0.1
redis-cli -h 172.17.0.2 -p 6379 
-bash: redis-cli: command not found
安装redis客户端
````
#wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
#rpm -ivh epel-release-latest-7.noarch.rpm
#yum install -y redis
````

docker pull nginx

### 4.3.	docker安装jenkins
docker pull jenkins/jenkins:lts
启动jenkins
docker run -itd -p 8889:8080 --name jenkins --privileged=true  -v /home/jenkins:/var/jenkins_home jenkins/jenkins:lts
出现下面这种情况
Please wait while Jenkins is getting ready to work ...
修改配置文件
hudson.model.UpdateCenter.xml
把
http://updates.jenkins-ci.org/update-center.json
改成
http://mirror.xmission.com/jenkins/updates/update-center.json

### 4.4.	查看容器的ip地址
首先安装net-tools
````
yum install net-tools -y
````
查看docker容器ip地址
````
cat /etc/hosts
````
或者使用ifconfig命令

docker run -d -p 9090:9090 -v /usr/springboot-1.jar:/usr/springboot-1.jar --name springboot  openjdk:8-jdk-alpine  java -jar /usr/springboot-1.jar

docker build -t test:1.0.0 

docker run -d -p 8888:8888 -v /var/log:/var/log  --name test test:1.0.0

## 5.	Docker Hello World
Docker 允许你在容器内运行应用程序， 使用 docker run 命令来在容器内运行一个应用程序。
### 5.1.	输出hello world
docker run ubuntu /bin/echo "Hello world"

### 5.2.	各个参数解析：
docker: Docker 的二进制执行文件。  
run:与前面的 docker 组合来运行一个容器。  
ubuntu:指定要运行的镜像，Docker首先从本地主机上查找镜像是否存在，如果不存在，Docker 就会从镜像仓库 Docker Hub 下载公共镜像。
/bin/echo "Hello world": 在启动的容器里执行的命令  
以上命令完整的意思可以解释为：Docker 以 ubuntu 镜像创建一个新容器，然后在容器里执行 bin/echo "Hello world"，然后输出结果。

### 5.3.	运行交互式的容器
我们通过docker的两个参数 -i -t，让docker运行的容器实现"对话"的能力  
````
docker run -i -t ubuntu /bin/bash
````
各个参数解析：  
-t:在新容器内指定一个伪终端或终端。  
-i:允许你对容器内的标准输入 (STDIN) 进行交互。  
此时我们已进入一个 ubuntu15.10系统的容器  
我们尝试在容器中运行命令 cat /proc/version和ls分别查看当前系统的版本信息和当前目录下的文件列表  
我们可以通过运行exit命令或者使用CTRL+D来退出容器。  

### 5.4.	启动容器（后台模式）
使用以下命令创建一个以进程方式运行的容器
````
docker run -d ubuntu /bin/sh -c "while true; do echo hello world; sleep 1; done"
````
### 5.5.	查看镜像进程
````
docker ps
````
CONTAINER ID:容器ID  
NAMES:自动分配的容器名称  
在容器内使用docker logs命令，查看容器内的标准输出  
````
docker logs CONTAINER ID/NAMES
````

### 5.6.	停止容器
我们使用 docker stop 命令来停止容器:  
````
docker stop CONTAINER ID
````
## 6.	docker容器使用
Docker 客户端
docker 客户端非常简单 ,我们可以直接输入 docker 命令来查看到 Docker 客户端的所有命令选项。  
可以通过命令 docker command --help 更深入的了解指定的 Docker 命令使用方法。  
例如我们要查看 docker stats 指令的具体使用方法：  
````
 docker stats --help
 ````
### 6.1.	查找镜像
````
docker search httpd
````
### 6.2.	拖取镜像
````
docker pull httpd
````
## 7.	docker 镜像使用
### 7.1.	创建Dockerfile
````
# vi Dockerfile
在文件中新增如下内容

#指定镜像基础,此处用的jdk8是docker比较常用的jak
FROM openjdk:8-jdk-alpine
#镜像维护者及联系方式
MAINTAINER *** "***"
  
# 添加jar包名，第一个jar包是打包的jar包名字，第二个是我们将jar包放进docker里面的名字
ADD test-0.0.1-SNAPSHOT.jar app.jar
 #docker暴露端口号
EXPOSE 8080
#挂载目录
VOLUME  /tmp
# Define default command.
#可解决tomcat可能启动慢的问题
-Djava.security.egd=file:/dev/./urandom
#容器开启运行命令，，号代表空格
ENTRYPOINT ["java","-jar","/app.jar"]
````

### 7.2.	构建镜像
docker build -t="xxx" .  
输入命令 （-t后面家名字：后面加版本号，最后有个.表示路径）  
````
docker build -t test:1.0.0 .
````
启动镜像
第一次运行
````
docker run -d -p 8081:8080 -v /var/log:/var/log  --name test test:1.0.0
````
运行之后启动
````
docker start 容器id
````
进入Container终端
````
docker exec -it 容器id   sh
````
查看日志
````
docker logs --tail=10 -f 容器ID
````
### 7.3.	修改镜像标签
````
docker tag a5f790305b76 stackzhang/centos:dev
````
### 7.4.	镜像的导出
先将镜像文件保存为tar文件
````
docker save -o admin-service.tar admin-service:1.0
````

### 7.5.	镜像的导入
docker load从本地文件库将文件导入至本地镜像库
````
docker load < admin-service.tar
````
查看镜像
````
docker images
````

## 8.	附录
#### Docker官方英文资源
- docker官网：http://www.docker.com
- Docker windows入门：https://docs.docker.com/windows/
- Docker Linux 入门：https://docs.docker.com/linux/
- Docker mac 入门：https://docs.docker.com/mac/
- Docker 用户指引：https://docs.docker.com/engine/userguide/
- Docker 官方博客：http://blog.docker.com/
- Docker Hub: https://hub.docker.com/
- Docker开源： https://www.docker.com/open-source

#### Docker中文资源
- Docker中文网站：http://www.docker.org.cn
- Docker安装手册：http://www.docker.org.cn/book/install.html
- 一小时Docker教程 ：https://blog.csphere.cn/archives/22
- Docker 从入门到实践：http://dockerpool.com/static/books/docker_practice/index.html
- Docker中文指南：http://www.widuu.com/chinese_docker/index.html

其它资源
- https://segmentfault.com/t/docker
- https://github.com/docker/docker
- https://wiki.openstack.org/wiki/Docker
- https://wiki.archlinux.org/index.php/Docker
