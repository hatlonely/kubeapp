ingress:
  enabled: true
  annotations:
    "kubernetes.io/ingress.class": nginx
    "kubernetes.io/tls-acme": "true"
    "nginx.ingress.kubernetes.io/backend-protocol": HTTPS
  hosts:
    - host: k8s.dashboard.hatlonely.com
      paths:
        - path: /
  tls:
    - secretName: k8s-secret
      hosts:
        - k8s.dashboard.hatlonely.com

rbac:
  create: true
  clusterAdminRole: true