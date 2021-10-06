#### 线程和进程的区别
> https://zhuanlan.zhihu.com/p/114453309


#### nio多路复用
##### IO模型:
1. 同步阻塞IO（Blocking IO）：即传统的IO模型。
2. 同步非阻塞IO（Non-blocking IO）：默认创建的socket都是阻塞的，非阻塞IO要求socket被设置为NONBLOCK。注意这里所说的NIO并非Java的NIO（New IO）库。
3. 多路复用IO（IO Multiplexing）：即经典的Reactor设计模式，有时也称为异步阻塞IO，Java中的Selector和Linux中的epoll都是这种模型。
4. 异步IO（Asynchronous IO）：即经典的Proactor设计模式，也称为异步非阻塞IO。

##### 多路复用IO模型（JAVA NIO就是采用此模式）
> 在多路复用IO模型中，会有一个线程（Java中的Selector）不断去轮询多个socket的状态，只有当socket真正有读写事件时，才真正调用实际的IO读写操作。因为在多路复用IO模型中，只需要使用一个线程就可以管理多个socket，系统不需要建立新的进程或者线程，也不必维护这些线程和进程，并且只有在真正有socket读写事件进行时，才会使用IO资源，所以它大大减少了资源占用。

#### netty的使用




#### epoll select poll区别
> https://www.cnblogs.com/aspirant/p/9166944.html



#### epoll实现原理有什么优势什么场景下用