cluster:
  enabled: true
  slaveCount: 2

usePassword: true
password: "${REDIS_PASSWORD}"

metrics:
  enabled: true
  image:
    registry: "${REGISTRY_ENDPOINT}"
    repository: "${REGISTRY_NAMESPACE}/redis-exporter"
    tag: 1.4.0-debian-10-r3

image:
  registry: "${REGISTRY_ENDPOINT}"
  repository: "${REGISTRY_NAMESPACE}/redis"
  tag: 5.0.7-debian-10-r32
  pullSecrets:
    - "${PULL_SECRET_NAME}"

master:
  persistence:
    enabled: true

slave:
  persistence:
    enabled: true
