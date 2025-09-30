**Dockerfile

FROM logstash:8.15.0
RUN echo 'OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)' >> /usr/share/logstash/lib/pluginmanager/install.rb
RUN bin/logstash-plugin install logstash-output-opensearch
RUN sed -i '/OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)/d' /usr/share/logstash/lib/pluginmanager/install.rb

* Install manual plugin for logstash on Private server:
Create file .zip plugin logstash-output-opensearch for logstash version 8.18.1
Step1: download logstash-8.18.1 from elastic.co/downloads/logstash
Step2: install logstash with tar -xvf logstash-8.18.1.tar.gz
Step3: On terminal run: bin/logstash-plugin install logstash-output-opensearch
Step3: Create file ZIP offline: 
       bin/logstash-plugin prepare-offline-pack --output logstash-output-opensearch.zip --overwrite logstash-output-opensearch
       # ---> out ogstash-output-opensearch.zip file containe plugin necessery
Step4: move file to private server need install plugin for logstash.
Step5: Install plugin: bin/logstash-plugin install file:///tmp/logstash-output-opensearch.zip

