ingress:
  enabled: true
  hosts:
    - host: "${PHPMYADMIN_HOST}"
      paths:
        - path: /
  tls:
    - secretName: "${SECRET_NAME}"
      hosts:
        - "${PHPMYADMIN_HOST}"