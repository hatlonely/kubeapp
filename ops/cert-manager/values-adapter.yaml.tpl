global:
  imagePullSecrets:
    - name: "${PULL_SECRET_NAME}"

replicaCount: 1

image:
  repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/cert-manager-controller
  tag: v1.6.1

startupapicheck:
  image:
    repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/cert-manager-ctl
    tag: v1.6.1

webhook:
  image:
    repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/cert-manager-webhook
    tag: v1.6.1

cainjector:
  image:
    repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/cert-manager-cainjector
    tag: v1.6.1
