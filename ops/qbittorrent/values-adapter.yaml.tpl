#image:
#  repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/qbittorrent

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

webService:
  type: ClusterIP
  port: 18080
