global:
  imagePullSecrets:
    - name: "${PULL_SECRET_NAME}"

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
    image:
      repository: quay.io/prometheus/prometheus
      tag: v2.28.1
    tolerations:
      - key: "node-role.kubernetes.io/master"
        operator: "Exists"
        effect: "NoSchedule"

alertmanager:
  alertmanagerSpec:
    image:
      repository: "${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/alertmanager"
      tag: v0.22.2
    tolerations:
      - key: "node-role.kubernetes.io/master"
        operator: "Exists"
        effect: "NoSchedule"

prometheusOperator:
  image:
    repository: "${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/prometheus-operator"
    tag: v0.49.0
  prometheusConfigReloaderImage:
    repository: "${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/prometheus-config-reloader"
    tag: v0.49.0
  tolerations:
    - key: "node-role.kubernetes.io/master"
      operator: "Exists"
      effect: "NoSchedule"
  admissionWebhooks:
    patch:
      tolerations:
        - key: "node-role.kubernetes.io/master"
          operator: "Exists"
          effect: "NoSchedule"

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
    pullSecrets:
      - "${PULL_SECRET_NAME}"
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

prometheus-node-exporter:
  image:
    repository: "${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/node-exporter"
    tag: v1.2.0
  serviceAccount:
    imagePullSecrets:
      - name: "${PULL_SECRET_NAME}"
