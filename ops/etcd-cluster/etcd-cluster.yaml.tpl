apiVersion: "etcd.database.coreos.com/v1beta2"
kind: "EtcdCluster"
metadata:
  namespace: "${NAMESPACE}"
  name: "etcd-cluster"
  annotations:
    etcd.database.coreos.com/scope: clusterwide
spec:
  size: 3
  version: "3.2.13"