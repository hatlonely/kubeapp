
controller:
  ingress:
    enabled: true
    apiVersion: "networking.k8s.io/v1"
    annotations:
     kubernetes.io/ingress.class: nginx
    hostName: "jenkins.${DOMAIN}"
    tls:
     - secretName: "${TLS_SECRET}"
       hosts:
         - "jenkins.${DOMAIN}"
