replicaCount: 3

hostNetwork: true

image:
  registry: "${REGISTRY_ENDPOINT}"
  repository: "${REGISTRY_NAMESPACE}/nginx-ingress-controller"
  tag: 1.7.0-debian-11-r2
  pullPolicy: IfNotPresent
  pullSecrets:
    - "${PULL_SECRET_NAME}"

defaultBackend:
  image:
    registry: "${REGISTRY_ENDPOINT}"
    repository: "${REGISTRY_NAMESPACE}/nginx"
    tag: 1.22.1-debian-11-r54
    pullPolicy: IfNotPresent
    pullSecrets:
      - "${PULL_SECRET_NAME}"
  replicaCount: 3
