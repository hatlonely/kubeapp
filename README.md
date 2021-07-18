# kubernetes apps

# 命令

```shell
ops --variable .cfg/dev.yaml -a dep

ops --variable .cfg/dev.yaml -a run --env dev --task namespace
ops --variable .cfg/dev.yaml -a run --env dev --task helm-add-repo

ops --variable .cfg/dev.yaml -a run --env dev --task mongo
```