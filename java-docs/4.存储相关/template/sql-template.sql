--sql-template
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- postgresql
--
--1.查询pg下所有表名
select tablename from pg_tables where schemaname = 'jrzjdb';

--2.查询pg下某表下所有字段
select * from information_schema.columns c
where table_schema = 'jrzjdb' and table_name = 't_area'
order by ordinal_position;

--3.查询pg某表下所有字段及对应的数据量
select schemaname, relname, n_live_tup
from pg_catalog.pg_stat_user_tables
where schemaname = 'jrzjdb'
order by n_live_tup desc;

--4.获取当前时间戳
select current_timestamp;

--5.当前时间+1个月 interval表示间隔
select now() + interval '1 month' from dual;

--6.修改字段非空
alter table t1 alter create_time drop not null;
--修改字段类型
alter table t1 alter column create_dept set data type varchar(255);

--7.复制表结构
create table t1_bak (like t1);
--完整复制一张表
create table t1_bak as (select * from t1);
--仅复制表结构
create table t1_bak as (select * from t1 limit 0);

--8.添加主键约束
alter table t1 add constraint;

--9.增加字段
alter table t1 add column create_time timestamp(6);
--修改字段名称
alter table t1 rename old_column_name new_column_name;

--10.索引
-- 查看索引
select * from pg_catalog.pg_indexes where tablename = 'tableName';
--创建索引
create index tbl_bb_idx on tbl_bb(id,name);
--删除索引
drop index tbl_bb_idx;

--11.执行计划
explain analyze select xxx;

--12.删除重建表结构
truncate table tbl_bb;
删除完毕执行以下命令,有助分析表查询正确
analyze tbl_bb;

--13.pgsql查询编码
--查询客户端编码
show client_encoding

--查询服务器编码
show server_encoding
--不存在则删除
create table if not exist
--分组排序
select name ,count(name) as num from t_name group by name order by num desc;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- postgresql db2 基本信息查询对照


--db2查询某schemal下所有表名
select tabname from SYSCAT.TABLES where TABSCHEMA ='HOUSEMSBK'

--db2查询某表下所有字段
select * from SYSCAT.COLUMNS where TABSCHEMA ='HOUSEMSBK'
and TABNAME = 'T_HOUSE_DISTRICT'
order by SYSCAT.COLUMNS.COLNO

--db2查询某表及该表的记录数
select tabname,card from syscat.tables where tabschema ='HOUSEMSBK'
--tabname: 表名
--card: 总行数
--tabschema: 模式、架构

--查询postgresql下所有表名
select tablename from pg_tables where schemaname = 'fjgldb_oad'

--查询postgresql某表下所有字段
select * from information_schema.columns c 
where table_schema = 'fjgldb_oad' and table_name  = 'people'
order by ordinal_position 

--查询postgresql某表及该表的记录数
select schemaname,relname ,n_live_tup from pg_catalog.pg_stat_user_tables 
order by n_live_tup desc; 
--schemaname： 模式
--relname ： 表名称
--n_live_tup : 总行数

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--14.两个表的数据插入
insert into db1_name (field1,field2) select field1,field2 from db2_name;
--多表关联情况(注意设置别名)
insert into a(field1,field2) select * from(select b.f1,c.f2 from b inner join c) as tb;

--15.截取字符串
--db2
select substr(str,m,n) from db1_name;
--substr(str,m,n) 表示从str的m个字符开始截取n个字符。注：m从1开始计数

--16.使用in查询总结
-- 1.使用in时,忽略null值,不会查询条件为null的数据
-- 2.使用not in时,如果not in后面的括号中没有null,会查询符合条件的数据,否则过滤条件为null的数据
-- 3.使用not in时,如果not in 后面的括号中有null,直接返回false,查询结果为空

--17.group by+ having查询重复的主键
select id from t_name group by id having count(id)>1;