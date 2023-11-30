
controller:
  imagePullSecretName: ${PULL_SECRET_NAME}
  image: "${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/jenkins"
  ingress:
    enabled: true
    apiVersion: "networking.k8s.io/v1"
    annotations:
     kubernetes.io/ingress.class: nginx
    hostName: "jenkins.${DOMAIN}"
    tls:
     - secretName: "${TLS_SECRET}"
       hosts:
         - "jenkins.${DOMAIN}"
  resources:
    requests:
      cpu: "50m"
      memory: "256Mi"
    limits:
      cpu: "4000m"
      memory: "8192Mi"
  sidecars:
    configAutoReload:
      image: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/k8s-sidecar:1.24.4
  affinity:
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
agent:
  imagePullSecretName: ${PULL_SECRET_NAME}
