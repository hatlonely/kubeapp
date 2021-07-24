elasticsearchHosts: "https://security-master:9200"

ingress:
  enabled: true
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
