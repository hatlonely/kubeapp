auth:
  rootPassword: $(kubectl get secret --namespace "${NAMESPACE}" mongo-mongodb -o jsonpath="{.data.mongodb-root-password}" | base64 --decode)
