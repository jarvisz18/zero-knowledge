## ES速查笔记

````shell script
GET /index/_mapping
GET /index/_settings
GET /index/_search/?scroll=2m

POST /index/_delete_by_query
````

#### 1.查询脚本

##### 01.scroll查询

````shell script
curl -u oaas:oaas -XPOST “ip:9500/index/_search/?scroll=2m”
````

##### 02.ES查询只返回某些字段

````shell script
GET /shakespeare/_search
{
 "_source": ["name","level"],
 "query": {},
 "size": {},
 "sort": {}
}
````

##### 03.ES查看执行计划

````shell script
GET /shakespeare/_search
{
 "explain": "true",
 "query": {}
}
````

##### 04.使用scroll查询需要指定size大小，否则size默认为10

````shell script
POST /shakespeare/_search?scroll=2m
{
 "size": 10000,
 "query": {
   "match_all": {}
 }
}
````

#### 05.查询settings

````shell script
curl -u oaas:oaas -XPOST "ip:9500/index/_settings"
````

#### 06.查询mapping

````shell script
curl -u oaas:oaas -XPOST "ip:9500/index/_mapping"
````

#### 2.常用查询关键字

````shell script
bool should must should_not must_not
match term terms wildcard multi_match
analyzer ngram nested sort
````

#### 3.索引关闭与开启

1.可以打开一个已经打开/关闭的索引，以最后一次操作为准  
2.可以关闭一个已经关闭/打开的索引，以最后一次操作为准  
3.关闭的索引只能查看index的配置信息，不能对内部的索引数据进行读写操作  

````shell script
POST /index/_close
POST /index/_open
// 可以使用_all 打开或关闭全部索引,也可以使用通配符(*)配合操作
````

#### 4.索引缓存刷新清空

````shell script
post _flush
post _cache/_clear
post /index/_cache/_clear
````

#### 5.根据某字段范围查询，类型具有范围

````jshelllanguage
GET shakespeare/_search?size=10000
{
  "query": {
    "range": {
      "line_id": {
        "gte": 1,
        "lte": 2
      }
    }
  }
}
````

#### 6.重建索引-reindex(数据迁移)

````jshelllanguage
POST _reindex
{
  "source": {
    "index": "shakespeare"
  },
  "dest": {
    "index": "shakespeare-new"
  }
}
````

#### 7.新建索引模板

````jshelllanguage
PUT /_template/shakespeare
{
  "order": 0,
  "index_patterns": [
    "shakespeare-*"
  ],
  "aliases": {},
  "mappings": {},
  "settings": {}
}
````

#### 10.注意事项

+ 若脚本指定sort排序字段，则评分为null
