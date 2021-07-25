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
  ingress:
    enabled: true
    path: /
    hosts:
      - "${GRAFANA_HOST}"
    tls:
      - secretName: "${SECRET_NAME}"
        hosts:
          - "${GRAFANA_HOST}"