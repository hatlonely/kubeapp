global:
  imagePullSecrets:
    - "${PULL_SECRET_NAME}"
  postgresql:
    auth:
      password: "${KUBEAPP_PASSWORD}"

ingress:
  enabled: true
  hostname: "${KUBEAPP_HOST}"
  ingressClassName: nginx
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt-http01
    kubernetes.io/tls-acme: "true"
  extraTls:
    - secretName: "${SECRET_NAME}"
      hosts:
        - "${KUBEAPP_HOST}"

postgresql:
  enabled: true
  auth:
    username: "postgres"
    postgresPassword: "${KUBEAPP_PASSWORD}"
    database: assets

frontend:
  image:
    registry: ${REGISTRY_ENDPOINT}
    repository: ${REGISTRY_NAMESPACE}/nginx
    tag: 1.23.4-debian-11-r0

dashboard:
  image:
    registry: ${REGISTRY_ENDPOINT}
    repository: ${REGISTRY_NAMESPACE}/kubeapps-dashboard
    tag: 2.6.4-debian-11-r7

apprepository:
  image:
    registry: ${REGISTRY_ENDPOINT}
    repository: ${REGISTRY_NAMESPACE}/kubeapps-apprepository-controller
    tag: 2.6.4-scratch-r2
  syncImage:
    registry: ${REGISTRY_ENDPOINT}
    repository: ${REGISTRY_NAMESPACE}/kubeapps-asset-syncer
    tag: 2.6.4-scratch-r2

kubeops:
  image:
    registry: ${REGISTRY_ENDPOINT}
    repository: ${REGISTRY_NAMESPACE}/kubeapps-kubeops
    tag: 2.4.1-scratch-r1

assetsvc:
  image:
    registry: ${REGISTRY_ENDPOINT}
    repository: ${REGISTRY_NAMESPACE}/kubeapps-assetsvc
    tag: 2.4.1-scratch-r1

authProxy:
  image:
    registry: ${REGISTRY_ENDPOINT}
    repository: ${REGISTRY_NAMESPACE}/oauth2-proxy
    tag: 7.4.0-debian-11-r52

pinnipedProxy:
  image:
    registry: ${REGISTRY_ENDPOINT}
    repository: ${REGISTRY_NAMESPACE}/kubeapps-pinniped-proxy
    tag: 2.6.4-debian-11-r7

testImage:
  registry: ${REGISTRY_ENDPOINT}
  repository: ${REGISTRY_NAMESPACE}/nginx
  tag: 1.21.3-debian-10-r50

kubeappsapis:
  image:
    registry: ${REGISTRY_ENDPOINT}
    repository: ${REGISTRY_NAMESPACE}/kubeapps-apis
    tag: 2.6.4-debian-11-r7
