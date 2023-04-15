FROM ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/elasticsearch:8.5.1

RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install -b https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v8.5.1/elasticsearch-analysis-ik-8.5.1.zip

