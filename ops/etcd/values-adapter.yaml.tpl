replicaCount: 6

global:
  imagePullSecrets:
    - "${PULL_SECRET_NAME}"
  storageClass: "${STORAGE_CLASS}"

image:
  registry: "${REGISTRY_ENDPOINT}"
  repository: "${REGISTRY_NAMESPACE}/etcd"
  tag: 3.5.4-debian-11-r8
  pullSecrets:
    - "${PULL_SECRET_NAME}"

auth:
  rbac:
    rootPassword: "123456"

persistence:
  enabled: false
  storageClass: "${STORAGE_CLASS}"
