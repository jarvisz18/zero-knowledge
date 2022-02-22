## Elastic学习笔记
#### 启动elasticsearch
sh /usr/local/opt/develop/elasticsearch-6.1.1/bin/elasticsearch &
#### 启动kibana
sh /usr/local/opt/develop/kibana-6.1.1/bin/kibana &

#### 1.查看所有索引
````shell script
curl -XGET "http://localhost:9200/_cat/indices?v"
````
#### 2.全匹配查看索引
````shell script
curl -XGET "http://localhost:9200/shake*/_search"
````
#### 3.查看索引模板
````shell script
curl -XGET "http://localhost:9200/_template"
````
#### 4.索引分组统计
````shell script
GET /shakespeare/_search
{
  "size": 0,
  "aggs": {
    "count": {
      "terms": {
        "field": "play_name",
        "size": 10
      }
    }
  }
}
````

#### 5.索引聚合统计
````shell script
GET /shakespeare/_search
{
  "size": 0,
  "aggs": {
    "doc_count": {
      "range": {
        "field": "play_name",
        "ranges": [
          {
            "from": 5,
            "to": 10
          }
        ]
      }
    }
  }
}
````

#### 6.根据条件删除索引
````shell script
POST empl/_delete_by_query
{"query":{"match_all":{}}}
````

#### 7.查询某一天的数据量
````shell script
GET empl/_search
{
  "track_total_hits":true,
  "query": {
    "range": {
      "age": {
        "gte": 18,
        "lte": 20
      }
    }
  }
}
````