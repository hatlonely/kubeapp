image:
  repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/jellyfin

ingress:
  enabled: true
  className: "nginx"
  annotations: {}
  hosts:
    - host: "${JELLYFIN_HOST}"
      paths:
        - path: /
          pathType: ImplementationSpecific
  tls:
    - secretName: "${SECRET_NAME}"
      hosts:
        - "${JELLYFIN_HOST}"
