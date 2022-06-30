apiVersion: fluentbit.fluent.io/v1alpha2
kind: FluentBit
metadata:
  name: fluent-bit
  namespace: fluent
  labels:
    app.kubernetes.io/name: fluent-bit
spec:
  image: kubesphere/fluent-bit:v1.8.11
  fluentBitConfigName: fluent-bit-config
  priorityClassName: system-node-critical
  resources:
    limits:
      cpu: %{ if vars.cpuLimit != "" }${vars.cpuLimit}%{ else }500m%{ endif }
      memory: %{ if vars.memLimit != "" }${vars.memLimit}%{ else }200Mi%{ endif }
    requests:
      cpu: %{ if vars.cpuRequest != "" }${vars.cpuRequest}%{ else }10m%{ endif }
      memory: %{ if vars.memRequest != "" }${vars.memRequest}%{ else }25Mi%{ endif }
  tolerations:
  - operator: Exists
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: node-role.kubernetes.io/edge
            operator: DoesNotExist
