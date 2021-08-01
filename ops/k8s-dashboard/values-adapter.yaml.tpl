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
    - secretName: k8s-secret
      hosts:
        - ${DASHBOARD_HOST}

rbac:
  create: true
  clusterAdminRole: true

tolerations:
  - key: "node-role.kubernetes.io/master"
    operator: "Exists"
    effect: "NoSchedule"