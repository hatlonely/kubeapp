elasticsearchHosts: "http://elasticsearch-master:9200"

ingress:
  enable: true
  hosts:
    - host: k8s.kibana.hatlonely.com
  tls:
    - secretName: k8s-secret
      hosts:
        - k8s.kibana.hatlonely.com
