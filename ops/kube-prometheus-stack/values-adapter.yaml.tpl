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
      registry: "${REGISTRY_ENDPOINT}"
      repository: "${REGISTRY_NAMESPACE}/prometheus"

alertmanager:
  alertmanagerSpec:
    image:
      registry: "${REGISTRY_ENDPOINT}"
      repository: "${REGISTRY_NAMESPACE}/alertmanager"

prometheusOperator:
  image:
    registry: "${REGISTRY_ENDPOINT}"
    repository: "${REGISTRY_NAMESPACE}/prometheus-operator"
  prometheusConfigReloaderImage:
    registry: "${REGISTRY_ENDPOINT}"
    repository: "${REGISTRY_NAMESPACE}/prometheus-config-reloader"
  thanosImage:
    registry: "${REGISTRY_ENDPOINT}"
    repository: "${REGISTRY_NAMESPACE}/thanos"
  admissionWebhooks:
    patch:
      enabled: true
      image:
        registry: "${REGISTRY_ENDPOINT}"
        repository: "${REGISTRY_NAMESPACE}/kube-webhook-certgen"

kube-state-metrics:
  image:
    registry: "${REGISTRY_ENDPOINT}"
    repository: "${REGISTRY_NAMESPACE}/kube-state-metrics"
  imagePullSecrets:
    - name: "${PULL_SECRET_NAME}"

grafana:
  adminPassword: "${GRAFANA_PASSWORD}"
  image:
    repository: "${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/grafana"
    pullSecrets:
      - "${PULL_SECRET_NAME}"
  sidecar:
    image:
      repository: "${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/k8s-sidecar"
  ingress:
    enabled: true
    annotations:
      cert-manager.io/cluster-issuer: letsencrypt-http01
      kubernetes.io/ingress.class: nginx
      kubernetes.io/tls-acme: "true"
    path: /
    hosts:
      - "${GRAFANA_HOST}"
    tls:
      - secretName: "${SECRET_NAME}"
        hosts:
          - "${GRAFANA_HOST}"
  grafana.ini:
    server:
      domain: ${GRAFANA_HOST}

prometheus-node-exporter:
  image:
    registry: "${REGISTRY_ENDPOINT}"
    repository: "${REGISTRY_NAMESPACE}/node-exporter"
  serviceAccount:
    imagePullSecrets:
      - name: "${PULL_SECRET_NAME}"
