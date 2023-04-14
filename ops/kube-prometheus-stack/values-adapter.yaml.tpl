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
    repository: quay.io/thanos/thanos
  admissionWebhooks:
    patch:
      enabled: true
      image:
        registry: "${REGISTRY_ENDPOINT}"
        repository: "${REGISTRY_NAMESPACE}/kube-webhook-certgen"
        tag: v20221220-controller-v1.5.1-58-g787ea74b6

kube-state-metrics:
  image:
    registry: "${REGISTRY_ENDPOINT}"
    repository: "${REGISTRY_NAMESPACE}/kube-state-metrics"
  imagePullSecrets:
    - name: "${PULL_SECRET_NAME}"

grafana:
  image:
    registry: "${REGISTRY_ENDPOINT}"
    repository: "${REGISTRY_NAMESPACE}/grafana"
    pullSecrets:
      - "${PULL_SECRET_NAME}"
  sidecar:
    image:
      registry: "${REGISTRY_ENDPOINT}"
      repository: "${REGISTRY_NAMESPACE}/k8s-sidecar"
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
