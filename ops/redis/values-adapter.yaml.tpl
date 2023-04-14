global:
  imagePullSecrets:
    - "${PULL_SECRET_NAME}"
  storageClass: "${STORAGE_CLASS}"
  redis:
    password: "${REDIS_PASSWORD}"

metrics:
  enabled: true
  image:
    registry: "${REGISTRY_ENDPOINT}"
    repository: "${REGISTRY_NAMESPACE}/redis-exporter"

image:
  registry: "${REGISTRY_ENDPOINT}"
  repository: "${REGISTRY_NAMESPACE}/redis"
  pullSecrets:
    - "${PULL_SECRET_NAME}"

master:
  persistence:
    enabled: true
    size: 32Gi

replica:
  replicaCount: 3
  persistence:
    enabled: true
    size: 32Gi

sentinel:
  enabled: true
  image:
    registry: "${REGISTRY_ENDPOINT}"
    repository: "${REGISTRY_NAMESPACE}/redis-sentinel"
