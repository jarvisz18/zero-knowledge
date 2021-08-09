####1.查看具体的class是从哪个jar包加载的
在JVM启动时，添加如下参数：  
````shell script
-verbose:class
````
此时，就会输出加载的class及对应的jar包信息。

另外,使用-XX:+TraceClassPaths或者在服务器上执行jinfo时，  
都能得到classpath包含的jar包  
#### 2.打印出类的加载顺序
需要在启动脚本中增加以下参数
````shell script
-XX:+TraceClassLoading
````
可以解决的问题:由于环境的不同，可能本地开发环境正常，但  
是发布到线上就会出现class冲突，  
可以在控制台打印出jvm加载类的日志

