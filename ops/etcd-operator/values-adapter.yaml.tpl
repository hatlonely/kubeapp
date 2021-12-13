etcdCluster:
  size: 3

global:
  imagePullSecrets:
    - name: "${PULL_SECRET_NAME}"

etcdCluster:
  image:
    repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/etcd
    tag: v3.2.25
    pullPolicy: Always

etcdOperator:
  replicaCount: 3
  image:
    repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/etcd-operator
    tag: v0.9.4
    pullPolicy: Always
  commandArgs:
    cluster-wide: true
  readinessProbe:
    enabled: true
  livenessProbe:
    initialDelaySeconds: 10
    enabled: true

backupOperator:
  image:
    repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/etcd-operator
    tag: v0.9.4
    pullPolicy: Always

restoreOperator:
  image:
    repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/etcd-operator
    tag: v0.9.4
    pullPolicy: Always
