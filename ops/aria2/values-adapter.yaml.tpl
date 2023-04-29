image:
  pullSecret: "${PULL_SECRET_NAME}"
  aria2Pro:
    repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/aria2-pro
  ariang:
    repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/ariang

aria2:
  token: "${ARIA2_PASSWORD}"

ingress:
  className: "nginx"
  host: "${ARIA2_HOST}"
  tls: "${TLS_SECRET}"

affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
        - matchExpressions:
          - key: "kubernetes.io/hostname"
            operator: In
            values:
              - "hatlonely-mac-mini-0"
              - "hatlonely-mac-mini-1"
