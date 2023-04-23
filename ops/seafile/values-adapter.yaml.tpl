image:
  repository: seafileltd/seafile-mc
  tag: 10.0.1

ingress:
  main:
    enabled: true
    annotations:
      kubernetes.io/ingress.class: nginx
    hosts:
      - host: "${SEAFILE_HOST}"
        paths:
          - path: /
            pathType: ImplementationSpecific
    tls:
      - secretName: "${TLS_SECRET}"
        hosts:
          - "${SEAFILE_HOST}"

env:
  TIME_ZONE: Etc/UTC
  DB_HOST: seafile-mariadb
  DB_ROOT_PASSWD: seafilerootpass
  SEAFILE_ADMIN_EMAIL: example@example.com
  SEAFILE_ADMIN_PASSWORD: seafileadminpass
  SEAFILE_SERVER_HOSTNAME: "${SEAFILE_HOST}"
  SEAFILE_SERVER_LETSENCRYPT: false

mariadb:
  enabled: true
  architecture: standalone
  auth:
    database: seafile
    username: seafile
    password: seafilepass
    rootPassword: seafilerootpass
  primary:
    persistence:
      enabled: false
