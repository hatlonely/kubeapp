ingress:
  enabled: true
  hostname: "${PHPMYADMIN_HOST}"
  hosts:
    - host: "${PHPMYADMIN_HOST}"
      paths:
        - path: /
  tls:
    - secretName: "${SECRET_NAME}"
      hosts:
        - "${PHPMYADMIN_HOST}"

image:
  registry: "${REGISTRY_ENDPOINT}"
  repository: "${REGISTRY_NAMESPACE}/phpmyadmin"
  tag: "5.1.1-debian-10-r20"
  pullSecrets:
    - "${PULL_SECRET_NAME}"
