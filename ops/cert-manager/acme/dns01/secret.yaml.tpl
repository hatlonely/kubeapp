apiVersion: v1
kind: Secret
metadata:
  name: alidns-secret
  namespace: cert-manager
data:
  access-key: "${DNS_AK}"
  secret-key: "${DNS_SK}"
