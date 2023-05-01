
controller:
  ingress:
    enabled: true
    apiVersion: "networking.k8s.io/v1"
    hostName: "jenkins.${DOMAIN}"
    tls:
     - secretName: "${SECRET_NAME}"
       hosts:
         - "jenkins.${DOMAIN}"
