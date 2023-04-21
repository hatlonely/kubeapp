image:
  repository: "${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/httpd"
  tag: "2.4"
  pullPolicy: IfNotPresent

imagePullSecrets:
  - name: "${PULL_SECRET_NAME}"

ingress:
  host: ${WEBDAV_HOST}
  tls:
    enabled: false

urls:
  /:
    - user: hatlonely
      password: keaiduo1

persistence:
  enabled: true
  type: nfs
  nfs:
    server: 192.168.0.101
    path: /nfs/Transmission
    readOnly: false
