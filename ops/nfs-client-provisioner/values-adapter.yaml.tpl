replicaCount: 3

image:
  repository: "${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/nfs-client-provisioner"
  tag: v3.1.0-k8s1.11
  pullPolicy: IfNotPresent

imagePullSecrets:
  - name: "${PULL_SECRET_NAME}"

nfs:
  server: 192.168.0.101
  path: /nfs/data2
  mountOptions:
    - "hard"
    - "nfsvers=3"

storageClass:
  defaultClass: true

tolerations:
  - key: "node-role.kubernetes.io/master"
    operator: "Exists"
    effect: "NoSchedule"