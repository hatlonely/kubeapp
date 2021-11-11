global:
  imagePullSecrets:
    - "${PULL_SECRET_NAME}"

frontend:
  image:
    registry: ${REGISTRY_ENDPOINT}
    repository: ${REGISTRY_NAMESPACE}/nginx
    tag: 1.21.3-debian-10-r50

dashboard:
  image:
    registry: ${REGISTRY_ENDPOINT}
    repository: ${REGISTRY_NAMESPACE}/kubeapps-dashboard
    tag: 2.4.1-debian-10-r18

apprepository:
  image:
    registry: ${REGISTRY_ENDPOINT}
    repository: ${REGISTRY_NAMESPACE}/kubeapps-apprepository-controller
    tag: 2.4.1-scratch-r1
  syncImage:
    registry: ${REGISTRY_ENDPOINT}
    repository: ${REGISTRY_NAMESPACE}/kubeapps-asset-syncer
    tag: 2.4.1-scratch-r1

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
    tag: 7.2.0-debian-10-r5

pinnipedProxy:
  image:
    registry: ${REGISTRY_ENDPOINT}
    repository: ${REGISTRY_NAMESPACE}/kubeapps-pinniped-proxy
    tag: 2.4.1-debian-10-r21

testImage:
  registry: ${REGISTRY_ENDPOINT}
  repository: ${REGISTRY_NAMESPACE}/nginx
  tag: 1.21.3-debian-10-r50

kubeappsapis:
  image:
    registry: ${REGISTRY_ENDPOINT}
    repository: ${REGISTRY_NAMESPACE}/kubeapps-apis
    tag: 2.4.1-debian-10-r21
