ingress:
  enabled: true
  hosts:
    - host: k8s.phpmyadmin.hatlonely.com
      paths:
        - path: /
  tls:
    - secretName: k8s-secret
      hosts:
        - k8s.phpmyadmin.hatlonely.com