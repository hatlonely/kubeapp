auth:
  rootPassword: $(kubectl get secret --namespace "${NAMESPACE}" "${app}" -o jsonpath="{.data.mysql-root-password}" | base64 --decode)

image:
  registry: "${REGISTRY_ENDPOINT}"
  repository: "${REGISTRY_NAMESPACE}/mysql"
  tag: 8.0.25-debian-10-r37
  pullSecrets:
    - "${PULL_SECRET_NAME}"

persistence:
  enabled: true
  size: 50Gi

metrics:
  enabled: true
