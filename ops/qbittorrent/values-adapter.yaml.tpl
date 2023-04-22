image:
  repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/qbittorrent

imagePullSecrets:
  - name: "${PULL_SECRET_NAME}"

ingress:
  enabled: true
  className: "nginx"
  annotations: {}
  hosts:
    - host: "${QBITTORRENT_HOST}"
      paths:
        - path: /
          pathType: ImplementationSpecific
  tls:
    - secretName: "${TLS_SECRET}"
      hosts:
        - "${QBITTORRENT_HOST}"

env:
  TZ: "Asia/Shanghai"

persistence:
  enabled: true
  additionalVolumes:
    - name: nfs
      nfs:
        server: 192.168.0.101
        path: /nfs/Transmission
        readOnly: false
  additionalMounts:
    - name: nfs
      mountPath: /downloads

metrics:
  enabled: false

btService:
  type: ClusterIP
  port: 16881
  externalIps:
    - 192.168.0.22

affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
        - matchExpressions:
          - key: "kubernetes.io/hostname"
            operator: In
            values:
              - "hatlonely-mac-mini-1"
