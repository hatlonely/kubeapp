image:
  repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/qbittorrent

ingress:
  main:
    enabled: true
    className: "nginx"
    annotations:
      kubernetes.io/ingress.class: nginx
    hosts:
      - host: "${QBITTORRENT_HOST}"
        paths:
          - path: /
            pathType: ImplementationSpecific
  #  tls:
  #    - secretName: "${SECRET_NAME}"
  #      hosts:
  #        - "${QBITTORRENT_HOST}"
