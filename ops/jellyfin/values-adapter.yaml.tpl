replicaCount: 1

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
#  tls:
#    - secretName: "${SECRET_NAME}"
#      hosts:
#        - "${JELLYFIN_HOST}"

persistence:
  config:
    enabled: true
    isPvc: false
    customVolume:
      nfs:
        server: 192.168.0.101
        path: /nfs/Transmission
        readOnly: false
  data:
    enabled: true
    isPvc: false
    customVolume:
      nfs:
        server: 192.168.0.101
        path: /nfs/Transmission
        readOnly: false

affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
        - matchExpressions:
            - key: "kubernetes.io/hostname"
              operator: In
              values:
                - "hatlonely-vc66-2"

extraVolumes:
  - name: dri
    hostPath:
      path: /usr/lib/x86_64-linux-gnu/dri
      type: Directory

extraVolumeMounts:
  - name: dri
    mountPath: /dev/dri

securityContext:
  privileged: true
  capabilities:
    add:
      - NET_ADMIN
