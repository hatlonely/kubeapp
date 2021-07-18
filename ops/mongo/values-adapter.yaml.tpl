auth:
  rootPassword: $(kubectl get secret --namespace dev mongo-mongodb -o jsonpath="{.data.mongodb-root-password}" | base64 --decode)
