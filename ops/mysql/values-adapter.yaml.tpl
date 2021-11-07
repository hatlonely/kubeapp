auth:
  rootPassword: "${MYSQL_PASSWORD}"

image:
  registry: "${REGISTRY_ENDPOINT}"
  repository: "${REGISTRY_NAMESPACE}/mysql"
  tag: 8.0.25-debian-10-r37
  pullSecrets:
    - "${PULL_SECRET_NAME}"

metrics:
  enabled: true

primary:
  persistence:
    enabled: true
    size: 50Gi

secondary:
  persistence:
    enabled: true
    size: 50Gi
