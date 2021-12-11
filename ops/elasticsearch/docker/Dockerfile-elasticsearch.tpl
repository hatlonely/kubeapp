FROM ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/elasticsearch:7.15.0

RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install -b https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.3.2/elasticsearch-analysis-ik-7.3.2.zip

