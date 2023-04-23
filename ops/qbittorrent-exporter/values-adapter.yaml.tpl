image:
  repository: caseyscarborough/qbittorrent-exporter
  tag: v1.3.2

password: "${QBITTORRENT_PASSWORD}"

affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
        - matchExpressions:
          - key: "kubernetes.io/hostname"
            operator: In
            values:
              - "hatlonely-mac-mini-0"
              - "hatlonely-mac-mini-1"
