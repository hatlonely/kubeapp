name: etcd-cluster
replica: 3

pullSecret: "${PULL_SECRET_NAME}"
image:
  repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/etcd
