provisionDataStore:
  cassandra: false
  elasticsearch: true
  kafka: false

storage:
  type: elasticsearch

query:
  ingress:
    enabled: true
    annotations:
      kubernetes.io/ingress.class: nginx
      kubernetes.io/tls-acme: "true"
    hosts:
       - "${JAEGER_HOST}"
    tls:
      - secretName: "${SECRET_NAME}"
        hosts:
          - "${JAEGER_HOST}"
    health:
      exposed: false
