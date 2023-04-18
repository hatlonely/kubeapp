ingress:
  main:
    enabled: true
    className: "nginx"
    annotations: { }
    hosts:
      - host: "${QBITTORRENT_HOST}"
        paths:
          - path: /
            pathType: ImplementationSpecific
  #  tls:
  #    - secretName: "${SECRET_NAME}"
  #      hosts:
  #        - "${QBITTORRENT_HOST}"
