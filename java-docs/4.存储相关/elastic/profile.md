## 检索性能分析：Profile API
####使用方法
启用profile，只需要在查询中加入 "profile": true即可。
````json
{
    "profile": "true",
    "query": {}
}
````
#### Profile API响应说明
+ Query  
Query 段由构成Query的元素以及它们的时间信息组成。Profile API结果中Query 部分的基本组成是：  
query type ：显示哪种类型的查询被触发。  
time: lucene执行此查询所用的时间。单位是毫秒。  
time_in_nanos – 执行此查询所用的时间。单位是纳秒。  
breakdown – 有关查询的更详细的细节，主要与lucene参数有关。  
children – 具有多个关键字的查询被拆分成相应术语的布尔查询，每个查询都作为单独的查询来执行。每个子查询的详细信息将填充到Profile API输出的子段中。

+ Rewrite Time  
由于多个关键字会分解以创建个别查询，所以在这个过程中肯定会花费一些时间。将查询重写一个或多个组合查询的时间被称为“重写时间”。(以纳秒为单位)。

+ Collectors  
在Lucene中，收集器是负责收集原始结果，收集和组合结果，执行结果排序等的过程。

