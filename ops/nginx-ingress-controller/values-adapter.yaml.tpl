replicaCount: 3

hostNetwork: true

image:
  registry: "${REGISTRY_ENDPOINT}"
  repository: "${REGISTRY_NAMESPACE}/nginx-ingress-controller"
  tag: 0.48.1-debian-10-r0
  pullPolicy: IfNotPresent
  pullSecrets:
    - "${PULL_SECRET_NAME}"

defaultBackend:
  image:
    registry: "${REGISTRY_ENDPOINT}"
    repository: "${REGISTRY_NAMESPACE}/nginx"
    tag: 1.21.1-debian-10-r7
    pullPolicy: IfNotPresent
    pullSecrets:
      - "${PULL_SECRET_NAME}"
  replicaCount: 3
