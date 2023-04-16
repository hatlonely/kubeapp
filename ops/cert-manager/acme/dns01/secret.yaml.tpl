apiVersion: v1
kind: Secret
metadata:
  name: alidns-secret
  namespace: cert-manager
data:
  access-key: "$(echo ${DNS_AK} | base64)"
  secret-key: "$(echo ${DNS_SK} | base64)"
