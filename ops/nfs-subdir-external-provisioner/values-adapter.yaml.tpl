replicaCount: 3

image:
  repository: "${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/nfs-subdir-external-provisioner"
  tag: v4.0.2
  pullPolicy: IfNotPresent

imagePullSecrets:
  - name: "${PULL_SECRET_NAME}"

nfs:
  server: 192.168.0.102
  path: /nfs/data
  mountOptions:
    - "hard"
    - "nfsvers=3"

storageClass:
  defaultClass: true
