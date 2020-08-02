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

