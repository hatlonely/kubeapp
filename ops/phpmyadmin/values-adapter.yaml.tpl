ingress:
  enabled: true
  annotations:
    kubernetes.io/ingress.class: nginx
    cert-manager.io/cluster-issuer: letsencrypt-http01
    kubernetes.io/tls-acme: "true"
  hostname: "${PHPMYADMIN_HOST}"
  hosts:
    - host: "${PHPMYADMIN_HOST}"
      paths:
        - path: /
  tls:
    - secretName: "${PHPMYADMIN_TLS}"
      hosts:
        - "${PHPMYADMIN_HOST}"

image:
  registry: "${REGISTRY_ENDPOINT}"
  repository: "${REGISTRY_NAMESPACE}/phpmyadmin"
  tag: "5.1.1-debian-10-r20"
  pullSecrets:
    - "${PULL_SECRET_NAME}"
