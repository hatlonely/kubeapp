global:
  imagePullSecrets:
    - "${PULL_SECRET_NAME}"
  storageClass: "${STORAGE_CLASS}"

image:
  registry: "${REGISTRY_ENDPOINT}"
  repository: "${REGISTRY_NAMESPACE}/mongodb"
  tag: 4.4.7-debian-10-r0
  pullSecrets:
    - "${PULL_SECRET_NAME}"

persistence:
  enabled: true
  storageClass: "${STORAGE_CLASS}"
  size: 50Gi

auth:
  rootPassword: $(kubectl get secret --namespace "${NAMESPACE}" mongo-mongodb -o jsonpath="{.data.mongodb-root-password}" | base64 --decode)
