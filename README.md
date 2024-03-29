# kubernetes apps

# 首次安装

```shell
ops --variable .cfg/dev.yaml -a run --env dev --task del-master-taint
ops --variable .cfg/dev.yaml -a run --env dev --task namespace
ops --variable .cfg/dev.yaml -a run --env dev --task pull-secret
ops --variable .cfg/dev.yaml -a run --env dev --task helm-add-repo

ops --variable .cfg/dev.yaml -a run --env dev --task nginx-ingress-controller --cmd=image
ops --variable .cfg/dev.yaml -a run --env dev --task kubernetes-dashboard --cmd=image
ops --variable .cfg/dev.yaml -a run --env dev --task nfs-subdir-external-provisioner --cmd=image
ops --variable .cfg/dev.yaml -a run --env dev --task kube-prometheus-stack --cmd=image
ops --variable .cfg/dev.yaml -a run --env dev --task jaeger --cmd=image
ops --variable .cfg/dev.yaml -a run --env dev --task mongo --cmd=image
ops --variable .cfg/dev.yaml -a run --env dev --task mysql --cmd=image
ops --variable .cfg/dev.yaml -a run --env dev --task elasticsearch --cmd=image
ops --variable .cfg/dev.yaml -a run --env dev --task elasticsearch --cmd=docker
ops --variable .cfg/dev.yaml -a run --env dev --task kibana --cmd=image
ops --variable .cfg/dev.yaml -a run --env dev --task redis --cmd=image
ops --variable .cfg/dev.yaml -a run --env dev --task kubeapps --cmd=image
ops --variable .cfg/dev.yaml -a run --env dev --task minio --cmd=image
ops --variable .cfg/dev.yaml -a run --env dev --task etcd-operator --cmd=image
ops --variable .cfg/dev.yaml -a run --env dev --task cert-manager --cmd=image
ops --variable .cfg/dev.yaml -a run --env dev --task alist --cmd=image

ops --variable .cfg/dev.yaml -a run --env dev --task nginx-ingress-controller --cmd=install
ops --variable .cfg/dev.yaml -a run --env dev --task kubernetes-dashboard --cmd=install
ops --variable .cfg/dev.yaml -a run --env dev --task nfs-subdir-external-provisioner --cmd=install
ops --variable .cfg/dev.yaml -a run --env dev --task kube-prometheus-stack --cmd=install
ops --variable .cfg/dev.yaml -a run --env dev --task jaeger --cmd=install
ops --variable .cfg/dev.yaml -a run --env dev --task mongo --cmd=install
ops --variable .cfg/dev.yaml -a run --env dev --task mysql --cmd=install
ops --variable .cfg/dev.yaml -a run --env dev --task phpmyadmin --cmd=install
ops --variable .cfg/dev.yaml -a run --env dev --task redis --cmd=install
ops --variable .cfg/dev.yaml -a run --env dev --task elasticsearch --cmd=ssl
ops --variable .cfg/dev.yaml -a run --env dev --task elasticsearch --cmd=install
ops --variable .cfg/dev.yaml -a run --env dev --task kibana --cmd=install
ops --variable .cfg/dev.yaml -a run --env dev --task etcd-operator --cmd=install
ops --variable .cfg/dev.yaml -a run --env dev --task etcd-cluster --cmd=install
ops --variable .cfg/dev.yaml -a run --env dev --task kubeapps --cmd=install
ops --variable .cfg/dev.yaml -a run --env dev --task minio --cmd=install
ops --variable .cfg/dev.yaml -a run --env dev --task cert-manager --cmd=install
ops --variable .cfg/dev.yaml -a run --env dev --task csi-driver-smb --cmd=install
ops --variable .cfg/dev.yaml -a run --env dev --task smb-pv --cmd=install
ops --variable .cfg/dev.yaml -a run --env dev --task nav --cmd=install
```

# 命令

```shell
ops --variable .cfg/dev.yaml -a dep

ops --variable .cfg/dev.yaml -a run --env dev --task namespace
ops --variable .cfg/dev.yaml -a run --env dev --task helm-add-repo

ops --variable .cfg/dev.yaml -a run --env dev --task mongo --cmd=diff
ops --variable .cfg/dev.yaml -a run --env dev --task mongo --cmd=install
ops --variable .cfg/dev.yaml -a run --env dev --task mongo --cmd=upgrade
ops --variable .cfg/dev.yaml -a run --env dev --task mongo --cmd=delete
ops --variable .cfg/dev.yaml -a run --env dev --task mongo --cmd=password
```
