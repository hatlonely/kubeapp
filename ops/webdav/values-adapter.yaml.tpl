ingress:
  host: ${WEBDAV_HOST}

urls:
  /:
    - user: hatlonely
      password: keaiduo1

persistence:
  enabled: true
  type: nfs
  nfs:
    server: 192.168.0.101
    path: /nfs/Transmission
    readOnly: false
