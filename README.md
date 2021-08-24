# kubernetes apps

# 首次安装

```shell
ops --variable .cfg/dev.yaml -a run --env ali --task namespace
ops --variable .cfg/dev.yaml -a run --env ali --task pull-secret
ops --variable .cfg/dev.yaml -a run --env ali --task helm-add-repo

ops --variable .cfg/dev.yaml -a run --env ali --task nginx-ingress-controller --cmd=image
ops --variable .cfg/dev.yaml -a run --env ali --task k8s-dashboard --cmd=image
ops --variable .cfg/dev.yaml -a run --env ali --task nfs-subdir-external-provisioner --cmd=image
ops --variable .cfg/dev.yaml -a run --env ali --task mongo --cmd=image
ops --variable .cfg/dev.yaml -a run --env ali --task mysql --cmd=image
ops --variable .cfg/dev.yaml -a run --env ali --task elasticsearch --cmd=image
ops --variable .cfg/dev.yaml -a run --env ali --task kube-prometheus-stack --cmd=image
ops --variable .cfg/dev.yaml -a run --env ali --task jaeger --cmd=image
ops --variable .cfg/dev.yaml -a run --env ali --task redis --cmd=image

ops --variable .cfg/dev.yaml -a run --env ali --task nginx-ingress-controller --cmd=install
ops --variable .cfg/dev.yaml -a run --env ali --task k8s-dashboard --cmd=install
ops --variable .cfg/dev.yaml -a run --env ali --task nfs-subdir-external-provisioner --cmd=install
ops --variable .cfg/dev.yaml -a run --env ali --task kube-prometheus-stack --cmd=install
ops --variable .cfg/dev.yaml -a run --env ali --task jaeger --cmd=install
ops --variable .cfg/dev.yaml -a run --env ali --task mongo --cmd=install
ops --variable .cfg/dev.yaml -a run --env ali --task mysql --cmd=install
ops --variable .cfg/dev.yaml -a run --env ali --task phpmyadmin --cmd=install
ops --variable .cfg/dev.yaml -a run --env ali --task redis --cmd=install
ops --variable .cfg/dev.yaml -a run --env ali --task elasticsearch --cmd=install
ops --variable .cfg/dev.yaml -a run --env ali --task kibana --cmd=install
ops --variable .cfg/dev.yaml -a run --env ali --task etcd-operator --cmd=install
ops --variable .cfg/dev.yaml -a run --env ali --task etcd-cluster --cmd=install
```

# 命令

```shell
ops --variable .cfg/dev.yaml -a dep

ops --variable .cfg/dev.yaml -a run --env ali --task namespace
ops --variable .cfg/dev.yaml -a run --env ali --task helm-add-repo

ops --variable .cfg/dev.yaml -a run --env ali --task mongo --cmd=diff
ops --variable .cfg/dev.yaml -a run --env ali --task mongo --cmd=install
ops --variable .cfg/dev.yaml -a run --env ali --task mongo --cmd=upgrade
ops --variable .cfg/dev.yaml -a run --env ali --task mongo --cmd=delete
ops --variable .cfg/dev.yaml -a run --env ali --task mongo --cmd=password
```