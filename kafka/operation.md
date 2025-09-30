**Check version kafka**
```
cd kafka
./bin/kafka-topics.sh -version
ps aux | grep zookeeper
```
- check list topic on kafka
```
./kafka-topic.sh --bootstrap-server localhost:9092 --list

resul: __consumer_offsets
cmp_metering_ssc
```
- Getting detail about a topic
```
./kafka-topic.sh --bootstrap-server localhost:9092 --describe
./kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic cmp_metering_ssc
./kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic cmp_metering_ssc --from-beginning
```
- Publisshing messeges to topic
```
./kafka-console-producer.sh --bootstrap-server localhost:9092 --topic kafka.learning.tweets
```
**CHECK list kafka topic and get demo data on a topic**
```
/home/scem/kafka/kafka-topic.sh --bootstrap-server localhost:9092 --list
./kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic cmp_platform.user --from-beginning

netstat -tulpn | grep -e 2181 -e 9092 -e 3888 -e 2888
```

- check currently retention
```
./kafka-topic.sh --bootstrap-server localhost:9092 --describe | grep retention.ms
```
-add-config retention for topic
```
./kafka-topic.sh --bootstrap-server localhost:9092 --alter --entity-type topics --entity-name {} --add-config retention.ms={}
```
- delete config retention in the topic
```
./kafka-topic.sh --bootstrap-server localhost:9092 --alter --entity-type topics --entity-name {} --delete-config retention.ms={}
```