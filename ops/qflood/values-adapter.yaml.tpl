image:
  repository: jesec/flood
  tag: 4.7.0

ingress:
  main:
    enabled: true
    annotations:
      kubernetes.io/ingress.class: nginx
    hosts:
      - host: "${FLOOD_HOST}"
        paths:
          - path: /
            pathType: ImplementationSpecific

env:
  FLOOD_rundir: /data
  FLOOD_allowedpath: /data
  FLOOD_auth: "none"
  FLOOD_qurl: "qbittorrent-webui"
  FLOOD_quser: "admin"
  FLOOD_qpaas: "${QBITTORRENT_PASSWORD}"
