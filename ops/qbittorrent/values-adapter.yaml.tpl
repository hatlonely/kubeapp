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
#  tls:
#    - secretName: "${SECRET_NAME}"
#      hosts:
#        - "${QBITTORRENT_HOST}"

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
      mountPath: /nfs

metrics:
  enabled: true
  serviceMonitor:
    enabled: true
  exporter:
    image:
      repository: esanchezm/prometheus-qbittorrent-exporter
      tag: v1.2.0
      pullPolicy: IfNotPresent
    env:
      user: "admin"
      password: "${QBITTORRENT_PASSWORD}"
      port: 9022
      logLevel: INFO

btService:
  type: ClusterIP
  port: 6881
  externalIps:
    - 192.168.0.12
