elasticsearchHosts: "http://elasticsearch-master:9200"

ingress:
  enabled: true
  hosts:
    - host: k8s.kibana.hatlonely.com
      paths:
        - path: /
  tls:
    - secretName: k8s-secret
      hosts:
        - k8s.kibana.hatlonely.com
