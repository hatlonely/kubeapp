persistence:
  enabled: true
  storageClass: "${STORAGE_CLASS}"
  size: 20Gi

ingress:
  enabled: true
  ingressClassName: "nginx"
  path: /
  hosts:
    - "${MINIO_HOST}"

consoleIngress:
  enabled: true
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt-http01
    kubernetes.io/ingress.class: nginx
    kubernetes.io/tls-acme: "true"
  path: /
  hosts:
    - "${MINIO_CONSOLE_HOST}"
  tls:
    - secretName: "${SECRET_NAME}"
      hosts:
        - "${MINIO_CONSOLE_HOST}"

users:
  - accessKey: ${MINIO_USERNAME}
    secretKey: ${MINIO_PASSWORD}
    policy: consoleAdmin

replicas: 6

image:
  repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/minio
  tag: RELEASE.2021-11-24T23-19-33Z
  pullPolicy: IfNotPresent

imagePullSecrets:
  - name: "${PULL_SECRET_NAME}"

mcImage:
  repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/mc
  tag: RELEASE.2021-11-16T20-37-36Z
  pullPolicy: IfNotPresent

resources:
  requests:
    memory: 200Mi
