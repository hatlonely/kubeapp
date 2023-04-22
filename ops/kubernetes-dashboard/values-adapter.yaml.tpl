image:
  repository: "${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/dashboard"
  tag: v2.4.0
  pullPolicy: IfNotPresent
  pullSecrets:
    - "${PULL_SECRET_NAME}"

ingress:
  enabled: true
  annotations:
    "kubernetes.io/ingress.class": nginx
    "kubernetes.io/tls-acme": "true"
    "nginx.ingress.kubernetes.io/backend-protocol": HTTPS
  paths:
    - /
  hosts:
    - ${DASHBOARD_HOST}
  tls:
    - secretName: ${TLS_SECRET}
      hosts:
        - ${DASHBOARD_HOST}

rbac:
  create: true
  clusterAdminRole: true
