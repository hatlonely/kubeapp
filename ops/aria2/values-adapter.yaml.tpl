image:
  pullSecret: "${PULL_SECRET_NAME}"
  aria2:
    repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/aria2-pro
    tag: latest
  ariang:
    repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/ariang
    tag: latest
  exporter:
    repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/aria2_exporter
    tag: latest

aria2:
  token: "${ARIA2_PASSWORD}"

ingress:
  className: "nginx"
  aria2Host: "aria2.${DOMAIN}"
  ariangHost: "ariang.${DOMAIN}"
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
