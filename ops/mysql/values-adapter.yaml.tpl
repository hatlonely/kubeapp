auth:
  rootPassword: "${MYSQL_PASSWORD}"

image:
  registry: "${REGISTRY_ENDPOINT}"
  repository: "${REGISTRY_NAMESPACE}/mysql"
  tag: 8.0.32-debian-11-r21
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
