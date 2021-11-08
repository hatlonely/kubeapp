frontend:
  image:
    registry: docker.io
    repository: bitnami/nginx
    tag: 1.21.3-debian-10-r50

dashboard:
  image:
    registry: docker.io
    repository: bitnami/kubeapps-dashboard
    tag: 2.4.1-debian-10-r18

apprepository
  image:
    registry: docker.io
    repository: bitnami/kubeapps-apprepository-controller
    tag: 2.4.1-scratch-r1
  syncImage:
    registry: docker.io
    repository: bitnami/kubeapps-asset-syncer
    tag: 2.4.1-scratch-r1

kubeops
  image:
    registry: docker.io
    repository: bitnami/kubeapps-kubeops
    tag: 2.4.1-scratch-r1

assetsvc:
  image:
    registry: docker.io
    repository: bitnami/kubeapps-assetsvc
    tag: 2.4.1-scratch-r1

authProxy:
  image:
    registry: docker.io
    repository: bitnami/oauth2-proxy
    tag: 7.2.0-debian-10-r5

pinnipedProxy:
  image:
    registry: docker.io
    repository: bitnami/kubeapps-pinniped-proxy
    tag: 2.4.1-debian-10-r21

testImage:
  registry: docker.io
  repository: bitnami/nginx
  tag: 1.21.3-debian-10-r50

kubeappsapis:
  image:
    registry: docker.io
    repository: bitnami/kubeapps-apis
    tag: 2.4.1-debian-10-r21
