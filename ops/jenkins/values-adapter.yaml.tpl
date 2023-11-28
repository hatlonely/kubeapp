
controller:
  imagePullSecretName: ${PULL_SECRET_NAME}
  image: "${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/jenkins"
  tagLabel: 2.426.1-jdk11
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
  sidecars:
    configAutoReload:
      image: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/k8s-sidecar:1.24.4
agent:
  imagePullSecretName: ${PULL_SECRET_NAME}
