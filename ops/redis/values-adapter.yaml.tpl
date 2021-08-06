cluster:
  enabled: true
  slaveCount: 2

usePassword: true

metrics:
  enabled: true

image:
  registry: "${REGISTRY_ENDPOINT}"
  repository: "${REGISTRY_NAMESPACE}/redis"
  tag: 5.0.7-debian-10-r32
