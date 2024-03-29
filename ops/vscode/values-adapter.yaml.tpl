image:
  repository: ${REGISTRY_ENDPOINT}/${REGISTRY_NAMESPACE}/code-server
  tag: '4.12.0'

securityContext:
  enabled: false

volumePermissions:
  enabled: false

ingress:
  enabled: true
  annotations:
    kubernetes.io/ingress.class: nginx
    kubernetes.io/tls-acme: "true"
  hosts:
    - host: vscode.${DOMAIN}
      paths:
        - /
  tls:
    - secretName: ${TLS_SECRET}
      hosts:
        - vscode.${DOMAIN}

service:
  port: 8443
