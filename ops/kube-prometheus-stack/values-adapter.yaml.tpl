prometheus:
  prometheusSpec:
    storageSpec:
      volumeClaimTemplate:
        spec:
          storageClassName: "${STORAGE_CLASS}"
          accessModes: ["ReadWriteOnce"]
          resources:
            requests:
              storage: 50Gi

kube-state-metrics:
  image:
    repository: "${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/kube-state-metrics"
    tag: 2.1.0
  imagePullSecrets:
    - name: "${PULL_SECRET_NAME}"

grafana:
  image:
    repository: "${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/grafana"
    tag: 8.0.5
  sidecar:
    image:
      repository: "${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/k8s-sidecar"
      tag: 1.12.2
  ingress:
    enabled: true
    path: /
    hosts:
      - "${GRAFANA_HOST}"
    tls:
      - secretName: "${SECRET_NAME}"
        hosts:
          - "${GRAFANA_HOST}"