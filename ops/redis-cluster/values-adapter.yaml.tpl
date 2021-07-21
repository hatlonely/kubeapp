password: $(kubectl get secret --namespace "${NAMESPACE}" "${app}" -o jsonpath="{.data.redis-password}" | base64 --decode)

usePassword: true

persistence:
  enabled: true
  size: 50Gi

metrics:
  enabled: true
