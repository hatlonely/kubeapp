persistence:
  enable: true

image: "${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/elasticsearch"
imageTag: "8.5.1-hl"
imagePullPolicy: "Always"
imagePullSecrets:
  - name: "${PULL_SECRET_NAME}"


#roles:
#  master: "true"
#  ingest: "true"
#  data: "true"

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

extraEnvs:
  - name: ELASTIC_PASSWORD
    valueFrom:
      secretKeyRef:
        name: elastic-credentials
        key: password
  - name: ELASTIC_USERNAME
    valueFrom:
      secretKeyRef:
        name: elastic-credentials
        key: username

secretMounts:
  - name: elastic-certificates
    secretName: elastic-certificates
    path: /usr/share/elasticsearch/config/certs
