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
    - name: downloads
      nfs:
        server: 192.168.0.102
        # 在 nfs 上执行命令变更目录归属 chown nobody:share -R .
        path: /nfs/share
        readOnly: false
    - name: config
      nfs:
        server: 192.168.0.101
        # 在 nfs 上执行命令变更目录归属 chown nobody:share -R .
        path: /nfs/kubeapps/qbittorrent
        readOnly: false
  additionalMounts:
    - name: downloads
      mountPath: /downloads
    - name: config
      mountPath: /config

metrics:
  enabled: false

btService:
  type: ClusterIP
  port: 16881
  externalIps:
    - 192.168.0.190

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
