#### 1.删除已经创建的索引
````sql
DROP INDEX "IFRS"."IDX_TABLE_NAME_INST_ID";
COMMIT ;
````
#### 2.备份表数据
````sql
create table user0708 like user;
insert into user0708 select * from user;
````
####3.修改表字段长度
````sql
ALTER TABLE LAWSERVICE.T_TASK
  ALTER COLUMN TASK_CONTENT SET DATA TYPE CLOB(102400);
COMMIT;
````
####4.解锁表
.原因：修改表结构表结构发生变化后再对表进行任何操作都不被允许，  
SQLState为57016（因为表不活动，所以不能对其进行访问），由于修改了表字段权限，  
导致表处于不可用状态
````sql
CALL SYSPROC.ADMIN_CMD('REORG TABLE tablename');
example:
CALL SYSPROC.ADMIN_CMD('REORG TABLE LAWSERVICE.T_TASK');
````



