image:
  baseRepo: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}
  smb:
    repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/smbplugin
    tag: v1.11.0
    pullPolicy: IfNotPresent
  csiProvisioner:
    repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/csi-provisioner
    tag: v3.5.0
    pullPolicy: IfNotPresent
  livenessProbe:
    repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/livenessprobe
    tag: v2.10.0
    pullPolicy: IfNotPresent
  nodeDriverRegistrar:
    repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/csi-node-driver-registrar
    tag: v2.8.0
    pullPolicy: IfNotPresent

imagePullSecrets:
  - "${PULL_SECRET_NAME}"
