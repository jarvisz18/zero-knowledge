## ES速查笔记
````shell script
GET /index/_mapping
GET /index/_settings
GET /index/_search/?scroll=2m

POST /index/_delete_by_query
````

#### 查询脚本

#### 常用查询关键字
````shell script
bool should must should_not must_not
match term terms wildcard multi_match
analyzer ngram nested sort
````

#### 索引关闭与开启
````shell script
post /index/_close
post /index/_open
````

#### 索引缓存刷新清空
````shell script
post _flush
post _cache/_clear
post /index/_cache/_clear
````

+ 若脚本指定sort排序字段，则评分为null

