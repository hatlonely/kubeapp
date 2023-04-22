global:
  imagePullSecrets:
    - "${PULL_SECRET_NAME}"

image:
  registry: "${REGISTRY_ENDPOINT}"
  repository: "${REGISTRY_NAMESPACE}/mongodb"

persistence:
  enabled: false

auth:
  rootPassword: "${MONGO_PASSWORD}"
