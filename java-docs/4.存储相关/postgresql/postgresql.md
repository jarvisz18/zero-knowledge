##postgresql笔记
####1.postgresql 环境安装
这里为了安装方便，使用docker方式安装  
命令如下:
````shell script
[root@localhost ~]# docker pull postgres:9.6
[root@localhost ~]# docker run --name postgres --restart=always -e POSTGRES_PASSWORD=123456 -p 5432:5432 -v pgdata:/var/lib/postgresql/data -d postgres:9.6

参数解释：
run，创建并运行一个容器；
--name，指定创建的容器的名字；
-e POSTGRES_PASSWORD=password，设置环境变量，指定数据库的登录口令为password；
-p 5432:5432，端口映射将容器的5432端口映射到外部机器的54321端口；
-d postgres:9.6，指定使用postgres:9.6作为镜像。
--restart=always 自启动
````

####2.创建用户、表结构
````sql
create user doc_db_oad password 'doc_db_oad@123';
create database doc_db_oad;
create schema doc_db_oad;
grant all privileges on database doc_db_oad to doc_db_oad;
````
 注意：这里使用超级用户postgres进行创建
 
 ####3.给表结构授予权限 
 ##### 3.1.进入postgresql容器  
 [root@localhost ~]# docker exec -it 88c2869b4102 /bin/bash  
 ##### 3.2.切换至postgres用户  
 [root@localhost ~]# su postgres
  
 ##### 3.3.psql下给表结构doc_db_oad进行授权  
 + 先使用超级用户postgres连接对应的库 
 ````sql 
 \c doc_db_oad postgres;  
  ```` 
 + 开始给模式为 doc_db_oad 授权给用户 doc_db_oad
 ````sql  
 GRANT ALL ON SCHEMA doc_db_oad TO doc_db_oad;  
 ````  
 + 然后使用doc_db_oad用户连接数据库doc_db_oad
 ````sql   
 \c doc_db_oad doc_db_oad;  
 ````
 + 创建一个表试试 
  ````sql 
 CREATE TABLE doc_db_oad.t1(id int);
 ````
 + 创建成功则授权成功。
 
 #####3.5 相关链接:  
 PostgreSQL 结构及权限
 https://jin-yang.github.io/post/postgresql-structure-privileges.html
 
 #####3.6 备注:
 ````sql
 --切换数据库
 \c workflow_db_oad;  
 --退出  
 \q
--以当前用户连接fjgldb_oad
psql -d fjgldb_oad;
--查看当前用户
select current_user;

show search_path -- 看到当前是public schema
--以doc_db_oad用户连接数据库doc_db_oad
gsql -d doc_db_oad -U doc_db_oad -W doc_db_oad@123  -r
````


####4.postgresql与db2常用查询
+ db2查询某schemal下所有表名
````sql
select tabname from SYSCAT.TABLES where TABSCHEMA ='HOUSEMSBK'
````

+ db2查询某表下所有字段
````sql
select * from SYSCAT.COLUMNS where TABSCHEMA ='HOUSEMSBK'
and TABNAME = 'T_HOUSE_DISTRICT'
order by SYSCAT.COLUMNS.COLNO
````
+ db2查询某表及该表的记录数
````sql
select tabname,card from syscat.tables where tabschema ='HOUSEMSBK'
--tabname: 表名
--card: 总行数
--tabschema: 模式、架构
````

+ 查询postgresql下所有表名
````sql
select tablename from pg_tables where schemaname = 'fjgldb_oad'
````

+ 查询postgresql某表下所有字段
````sql
select * from information_schema.columns c 
where table_schema = 'fjgldb_oad' and table_name  = 'people'
order by ordinal_position 
````

+ 查询postgresql某表及该表的记录数
````sql
select schemaname,relname ,n_live_tup from pg_catalog.pg_stat_user_tables 
order by n_live_tup desc; 
--schemaname： 模式
--relname ： 表名称
--n_live_tup : 总行数
````
