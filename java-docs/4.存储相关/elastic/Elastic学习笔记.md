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