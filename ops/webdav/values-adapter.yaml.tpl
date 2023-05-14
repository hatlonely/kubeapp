image:
  repository: "${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/httpd"
  tag: "2.4"
  pullPolicy: IfNotPresent

imagePullSecrets:
  - name: "${PULL_SECRET_NAME}"

ingress:
  host: webdav.${DOMAIN}
  tls:
    enabled: true
    secret: ${TLS_SECRET}

urls:
  /:
    - user: ${WEBDAV_USERNAME}
      password: ${WEBDAV_PASSWORD}
  /hatlonely:
    - user: hatlonely
      password: ${HATLONELY_PASSWORD}
  /liang:
    - user: liang
      password: ${LIANG_PASSWORD}
  /zach:
    - user: zach
      password: ${ZACH_PASSWORD}

persistence:
  enabled: true
  type: nfs
  nfs:
    server: 192.168.0.102
    path: /nfs/share
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
