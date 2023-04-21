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
  FLOOD_OPTION_rundir: /data
  FLOOD_OPTION_allowedpath: /data
  FLOOD_OPTION_auth: "none"
  FLOOD_OPTION_qurl: "qbittorrent-webui"
  FLOOD_OPTION_quser: "admin"
  FLOOD_OPTION_qpaas: "${QBITTORRENT_PASSWORD}"
