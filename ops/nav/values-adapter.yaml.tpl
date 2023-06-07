image:
  pullSecret: "${PULL_SECRET_NAME}"
  repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/nav
  tag: 1.0.0

ingress:
  host: "nav.${DOMAIN}"
  tls: "${TLS_SECRET}"
