elasticsearchHosts: "https://elasticsearch-master:9200"
elasticsearchCertificateSecret: elastic-certificate-pem
elasticsearchCertificateAuthoritiesFile: elastic-certificate.pem
elasticsearchCredentialSecret: elasticsearch-master-credentials

replicas: 2

#image: "${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/kibana"
#imageTag: "8.5.1"
imagePullSecrets:
  - name: "${PULL_SECRET_NAME}"

ingress:
  enabled: true
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt-http01
    kubernetes.io/tls-acme: "true"
  hosts:
    - host: "${KIBANA_HOST}"
      paths:
        - path: /

extraEnvs:
  - name: 'KIBANA_ENCRYPTION_KEY'
    valueFrom:
      secretKeyRef:
        name: kibana
        key: encryptionkey

createCert: false
protocol: https

kibanaConfig:
  kibana.yml: |
    xpack.security.encryptionKey: \${KIBANA_ENCRYPTION_KEY}
    server.ssl.enabled: true
    server.ssl.certificate: /usr/share/kibana/config/certs/elastic-certificate.pem
    server.ssl.key: /usr/share/kibana/config/certs/elastic-certificate.pem

