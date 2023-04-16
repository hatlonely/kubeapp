replicaCount: 2

image:
  repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/jellyfin
  tag: "10.8.9"

imagePullSecrets:
  - name: "${PULL_SECRET_NAME}"

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

persistence:
  data:
    enabled: true
    isPvc: false
    customVolume:
      nfs:
        server: 192.168.0.101
        path: /nfs/Transmission
        readOnly: false
