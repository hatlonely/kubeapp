ingress:
  enabled: true
  annotations:
    kubernetes.io/ingress.class: nginx
    cert-manager.io/cluster-issuer: letsencrypt-http01
    kubernetes.io/tls-acme: "true"
  hostname: "${PHPMYADMIN_HOST}"
  tls:
    - secretName: "${PHPMYADMIN_TLS}"
      hosts:
        - "${PHPMYADMIN_HOST}"

image:
  registry: "${REGISTRY_ENDPOINT}"
  repository: "${REGISTRY_NAMESPACE}/phpmyadmin"
  pullSecrets:
    - "${PULL_SECRET_NAME}"
