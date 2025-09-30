**CHECK OP CLUSTER**
```
curl -XGET -k -u 'admin:pass' "https://$HOSTNAME:9200/_cat/nodes?v=true"

curl -XGET -k -u 'admin:pass' "https://$HOSTNAME:9200/_cluster/health"

curl -XGET -k -u 'admin:pass' "https://$HOSTNAME:9200/_cat/templates?v=true&pretty"

curl -XGET -k -u 'admin:pass' "https://$HOSTNAME:9200/_cat/indices?v

curl -XGET -k -u 'admin:pass' "https://$HOSTNAME:9200/_cat/shards?v"

curl -XGET -k -u 'admin:pass' "https://$HOSTNAME:9200/_plugins/_ism/policies/fw-logging-policy"

curl -XGET -k -u 'admin:pass' "https://$HOSTNAME:9200/_plugins/_ism/explain/sg-fw-01"

curl -XGET -k -u 'admin:pass' "https://$HOSTNAME:9200/_cluster/settings"

curl -XGET -k -u 'admin:pass' "https://$HOSTNAME:9200/_cat/templates?v"
```