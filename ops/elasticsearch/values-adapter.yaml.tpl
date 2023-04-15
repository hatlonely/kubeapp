persistence:
  enable: true

image: "${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/elasticsearch"
imageTag: "8.5.1-hl"
imagePullPolicy: "Always"
imagePullSecrets:
  - name: "${PULL_SECRET_NAME}"

clusterName: "elasticsearch"
nodeGroup: "master"

createCert: false
secret:
  password: "${ELASTICSEARCH_PASSWORD}"

roles:
  - master
  - ingest
  - data

protocol: https

esConfig:
  elasticsearch.yml: |
    xpack.security.enabled: true
    xpack.security.transport.ssl.enabled: true
    xpack.security.transport.ssl.verification_mode: certificate
    xpack.security.transport.ssl.keystore.path: /usr/share/elasticsearch/config/certs/elastic-certificates.p12
    xpack.security.transport.ssl.truststore.path: /usr/share/elasticsearch/config/certs/elastic-certificates.p12
    xpack.security.http.ssl.enabled: true
    xpack.security.http.ssl.truststore.path: /usr/share/elasticsearch/config/certs/elastic-certificates.p12
    xpack.security.http.ssl.keystore.path: /usr/share/elasticsearch/config/certs/elastic-certificates.p12

secretMounts:
  - name: elastic-certificates
    secretName: elastic-certificates
    path: /usr/share/elasticsearch/config/certs
