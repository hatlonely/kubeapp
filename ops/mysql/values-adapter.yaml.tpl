auth:
  rootPassword: $(kubectl get secret --namespace "${NAMESPACE}" "${app}" -o jsonpath="{.data.mysql-root-password}" | base64 --decode)

image:
  registry: "${REGISTRY_ENDPOINT}"
  repository: "${REGISTRY_NAMESPACE}/mysql"
  tag: 8.0.25-debian-10-r37
  pullSecrets:
    - "${PULL_SECRET_NAME}"

metrics:
  enabled: true

primary:
  persistence:
    enabled: true
    size: 50Gi
  podSecurityContext:
    enabled: true
    fsGroup: 1000
  containerSecurityContext:
    enabled: true
    runAsUser: 1000
  tolerations:
    - key: "node-role.kubernetes.io/master"
      operator: "Exists"
      effect: "NoSchedule"

secondary:
  persistence:
    enabled: true
    size: 50Gi
  podSecurityContext:
    enabled: true
    fsGroup: 1000
  containerSecurityContext:
    enabled: true
    runAsUser: 1000
  tolerations:
    - key: "node-role.kubernetes.io/master"
      operator: "Exists"
      effect: "NoSchedule"
