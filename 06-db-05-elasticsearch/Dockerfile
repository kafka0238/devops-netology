FROM    centos:7

WORKDIR /home/elasticsearch/

RUN     yum update -y && yum install wget -y
RUN     wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.13.3-linux-x86_64.tar.gz
RUN     tar -xzf elasticsearch-7.13.3-linux-x86_64.tar.gz
COPY 	elasticsearch.yml /home/elasticsearch/elasticsearch-7.13.3/config/
RUN     mkdir /var/lib/elasticsearch
RUN     mkdir /home/elasticsearch/elasticsearch-7.13.3/snapshots
RUN     groupadd elasticsearch && useradd elasticsearch -g elasticsearch -p elasticsearch && \
        chown -R elasticsearch:elasticsearch /home/elasticsearch/ && chown -R elasticsearch:elasticsearch /var/lib/elasticsearch

EXPOSE  9200

WORKDIR /home/elasticsearch/elasticsearch-7.13.3/

USER    elasticsearch:elasticsearch

CMD     ["bash", "./bin/elasticsearch"]