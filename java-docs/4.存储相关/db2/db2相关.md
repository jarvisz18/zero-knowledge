#### 1.删除已经创建的索引
````shell script
DROP INDEX "IFRS"."IDX_TABLE_NAME_INST_ID";
COMMIT ;
````
#### 2.备份表数据
````shell script
create table user0708 like user;
insert into user0708 select * from user;
````
####3.修改表字段长度
````shell script
ALTER TABLE LAWSERVICE.T_TASK
  ALTER COLUMN TASK_CONTENT SET DATA TYPE CLOB(102400);
COMMIT;
````
####4.解锁表
.原因：修改表结构表结构发生变化后再对表进行任何操作都不被允许，  
SQLState为57016（因为表不活动，所以不能对其进行访问），由于修改了表字段权限，  
导致表处于不可用状态
````shell script
CALL SYSPROC.ADMIN_CMD('REORG TABLE tablename');
example:
CALL SYSPROC.ADMIN_CMD('REORG TABLE LAWSERVICE.T_TASK');
````

#### 5.主键删除添加
````shell script
ALTER TABLE Skills DELETE PRIMARY KEY
ALTER TABLE Skills ADD PRIMARY KEY （SKILL_ID）
````
#### 6.DB2单个字段注释添加
````shell script
COMMENT ON TABLE T_TABLE IS '测试表';
COMMENT ON COLUMN T_TABLE.START_TIME IS '请求开始时间';
````
#### 7.db2数据库创建索引，删除索引，查看表索引，SQL语句执行计划以及优化建议
````shell script
1、建立表索引
    create index 索引名 on 表名(列名，列名);
2、删除表索引
    drop index 索引名 on 表名;
3、查看表索引
    select * from sysibm.sysindexes where tbname='表名';   ---表名区分大小写
    或者在后台可以用：
    describe indexes for table 表名;
4、查看SQL语句执行计划
    db2expln -d 库名 -f test.sql -t -g -z ";" > test.exp
5、查看SQL语句索引优化建议
    db2advis -d 库名 -i test.sql
````


