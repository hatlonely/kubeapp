image:
  pullSecret: "${PULL_SECRET_NAME}"
  repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/alist
  tag: v3.17.0

ingress:
  host: "alist.${DOMAIN}"
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
