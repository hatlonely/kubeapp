auth:
  rootPassword: $(kubectl get secret --namespace "${NAMESPACE}" "${app}" -o jsonpath="{.data.mysql-root-password}" | base64 --decode)

persistence:
  enabled: true
  size: 50Gi

metrics:
  enabled: true
