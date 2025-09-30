https://github.com/prometheus/prometheus/discussions/14735
**And i run this below code for automatic make the Prometheus Data source**
```
POST _plugins/_query/_datasources
{
"name" : "my_prometheus",
"connector": "prometheus",
"properties" : {
"prometheus.uri" : "[http://prometheus-server.default.svc.cluster.local:80](http://prometheus-server.default.svc.cluster.local/)"
},
"allowedRoles" : ["all_access"]
}
```
When i run this code i go to the Data Sources the path of Data Sources is "OpenSearch Dashboard > Management > Dashboard Management > Data Sources"

create a Monitor in Alerting the path of Create Monitor is "OpenSearch Dashboard > OpenSearch Plugins > Alerting > Monitors > Create Monitor" in the Form "Select Data" i select indexes ".ql-datasources" and i try the query for show all fields of "my_prometheus" but there are not any response see the below image :
```
