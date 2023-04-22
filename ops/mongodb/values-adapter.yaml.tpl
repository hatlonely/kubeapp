global:
  imagePullSecrets:
    - "${PULL_SECRET_NAME}"

image:
  registry: "${REGISTRY_ENDPOINT}"
  repository: "${REGISTRY_NAMESPACE}/mongodb"

persistence:
  enabled: true
  storageClass: "${STORAGE_CLASS}"
  size: 50Gi

auth:
  rootPassword: "${MONGO_PASSWORD}"

