elasticsearchHosts: "https://security-master:9200"

replicas: 2

image: "${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/kibana"
imageTag: "7.15.0"
imagePullSecrets:
  - name: "${PULL_SECRET_NAME}"

ingress:
  enabled: true
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt-http01
    kubernetes.io/ingress.class: nginx
    kubernetes.io/tls-acme: "true"
  hosts:
    - host: "${KIBANA_HOST}"
      paths:
        - path: /
  tls:
    - secretName: "${SECRET_NAME}"
      hosts:
        - "${KIBANA_HOST}"

extraEnvs:
  - name: 'ELASTICSEARCH_USERNAME'
    valueFrom:
      secretKeyRef:
        name: elastic-credentials
        key: username
  - name: 'ELASTICSEARCH_PASSWORD'
    valueFrom:
      secretKeyRef:
        name: elastic-credentials
        key: password
  - name: 'KIBANA_ENCRYPTION_KEY'
    valueFrom:
      secretKeyRef:
        name: kibana
        key: encryptionkey

protocol: http

kibanaConfig:
  kibana.yml: |
    xpack.security.encryptionKey: \${KIBANA_ENCRYPTION_KEY}
    elasticsearch.ssl:
      certificateAuthorities: /usr/share/kibana/config/certs/elastic-certificate.pem
      verificationMode: certificate

secretMounts:
  - name: elastic-certificate-pem
    secretName: elastic-certificate-pem
    path: /usr/share/kibana/config/certs
