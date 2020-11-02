+ 1.windows下nginx解压后即可使用，但不可解压在中文目录下  
注意：一般软件最后放在英文目录下，且目录中不要有空格，否则可能会出现各种奇怪问题 
 
+ 2.查找nginx  
ps aux | grep nginx  
或查找配置文件  
find / -name nginx.conf  

+ 3.nginx平滑重启  
./sbin/nginx -s reload