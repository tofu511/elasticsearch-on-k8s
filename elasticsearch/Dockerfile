FROM launcher.gcr.io/google/elasticsearch6:6.3

RUN yes | bin/elasticsearch-plugin install analysis-kuromoji
RUN yes | bin/elasticsearch-plugin install analysis-icu
RUN yes | bin/elasticsearch-plugin install org.codelibs:elasticsearch-analysis-kuromoji-neologd:6.3.1

ADD config /usr/share/elasticsearch/config/

ENV ES_JAVA_OPTS "-Xms256m -Xmx256m"
ENV CLUSTER_NAME elasticsearch
ENV NODE_MASTER true
ENV NODE_DATA true
ENV NODE_INGEST true
ENV NETWORK_HOST _eth0:ipv4_
ENV HTTP_CORS_ENABLE true
ENV HTTP_CORS_ALLOW_ORIGIN *
ENV NUMBER_OF_MASTERS 1
ENV MAX_LOCAL_STORAGE_NODES 1
ENV SHARD_ALLOCATION_AWARENESS ""
ENV SHARD_ALLOCATION_AWARENESS_ATTR ""
ENV MEMORY_LOCK false
ENV DISCOVERY_SERVICE elasticsearch-discovery