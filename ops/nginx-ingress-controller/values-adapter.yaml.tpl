replicaCount: 3

hostNetwork: true

image:
  registry: "${REGISTRY_ENDPOINT}"
  repository: "${REGISTRY_NAMESPACE}/nginx-ingress-controller"
  tag: 1.7.0-debian-11-r2
  pullPolicy: IfNotPresent
  pullSecrets:
    - "${PULL_SECRET_NAME}"

defaultBackend:
  image:
    registry: "${REGISTRY_ENDPOINT}"
    repository: "${REGISTRY_NAMESPACE}/nginx"
    tag: 1.22.1-debian-11-r54
    pullPolicy: IfNotPresent
    pullSecrets:
      - "${PULL_SECRET_NAME}"
  replicaCount: 3

affinity:
  podAntiAffinity:
    preferredDuringSchedulingIgnoredDuringExecution:
      - podAffinityTerm:
          labelSelector:
            matchLabels:
              app.kubernetes.io/name: nginx-ingress-controller
              app.kubernetes.io/instance: nginx-ingress-controller
              app.kubernetes.io/component: controller
          topologyKey: kubernetes.io/hostname
        weight: 1
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
        - matchExpressions:
            - key: "kubernetes.io/hostname"
              operator: In
              values:
                - "hatlonely-vc66-0"
                - "hatlonely-vc66-1"
                - "hatlonely-vc66-2"

# 这个 metrics 没有成功，service 配置看上去没问题，不知道是不是两个 service 都是一个 deployment 有冲突
#containerPorts:
#  metrics: 9913

#metrics:
#  enabled: true
#  service:
#    ports:
#      metrics: 10254
#  serviceMonitor:
#    enabled: true
#    interval: 30s
#    labels:
#      release: kube-prometheus-stack
