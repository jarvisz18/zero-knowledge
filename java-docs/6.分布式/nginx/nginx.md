+ 1.windows下nginx解压后即可使用，但不可解压在中文目录下  
注意：一般软件最后放在英文目录下，且目录中不要有空格，否则可能会出现各种奇怪问题 
 
+ 2.查找nginx  
ps aux | grep nginx  
或查找配置文件  
find / -name nginx.conf  

+ 3.nginx平滑重启  
./sbin/nginx -s reload

#### Nginx常见问题及解决方案
1.配置了Nginx代理，接口请求出现413错误  
问题分析:413表示请求实体太大，超过了Nginx默认限制或者现有限制  
解决方案:调整 **client_max_body_size**，该参数可以在http,server及location处设置

