# kubernetes apps

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