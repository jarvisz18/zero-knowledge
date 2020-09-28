####1.查看具体的class是从哪个jar包加载的
在JVM启动时，添加如下参数：  
````shell script
-verbose:class
````
此时，就会输出加载的class及对应的jar包信息。

另外,使用-XX:+TraceClassPaths或者在服务器上执行jinfo时，  
都能得到classpath包含的jar包  
#### 2.打印出类的加载顺序
````shell script
XX:+TraceClassLoading
````

