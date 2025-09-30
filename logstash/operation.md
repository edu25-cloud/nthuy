**Logstash on VM**
- file config
```
vi /etc/hosts
sudo vi /etc/sysctl.conf
vm.max_map_count=262144
sudo sysctl -p

systemctl status firewalld
sestatus

vi /etc/rsyslog.conf
user.* action(type="omfwd" target="127.0.0.1" port="10514" template="vrli-json-template" protocol="tcp")
local6.* action(type="omfwd" target="127.0.0.1" port="20514" template="vrli-json-template" protocol="tcp")

:syslogtag, contains, "FIREWALL_PKTLOG" stop
:syslogtag, contains, "NSX" stop

vi /etc/rsyslog.d/vrli-json-template.conf
template(name="vrli-json-template" type="list")
{
    constant(value="{")
    constant(value="\"@timestamp\":\"")
      property(name="timestamp" dateFormat="rfc3339")
    constant(value="\",\"timegenerated\":\"")
      property(name="timegenerated" dateFormat="rfc3339") 
    constant(value="\",\"message\":\"")
      property(name="msg" format="json") 
    constant(value="\",\"host\":\"")
      property(name="hostname")
    constant(value="\",\"sysloghost\":\"")
      property(name="$myhostname$") 
    constant(value="\"}\n")
}

vi /etc/systemd/system/logstash.service

home/user/logstash
...config/logstash.yaml / jvm.options / pipelines.yml/ pipelines/sg.cfg
```
- check status
```
systemctl status ryslog
systemctl enable logstash
systemctl status logstash
systemctl start logstash
systemctl stop logstash

netstart -pnltu | grep -e 514 -e 9600
tail -100f lostash/logs/logstash-plain.log

curl -XGET localhost:9600/_node/stats/events?pretty

curl -XGET localhost:9600/_node/hot_threads?pretty

curl -XGET localhost:9600/_node/plugins?pretty

ln -sfn /home/user/logstash-8.9.0 /home/user/logstash
```
**operation**
sudo tcpdump -i any -A tcp and port 20514
