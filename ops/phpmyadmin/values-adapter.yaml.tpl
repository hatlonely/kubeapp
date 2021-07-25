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