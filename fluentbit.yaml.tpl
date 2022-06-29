apiVersion: logging.kubesphere.io/v1alpha2
kind: FluentBit
metadata:
  name: fluent-bit
  namespace: kubesphere-logging-system
  labels:
    app.kubernetes.io/name: fluent-bit
  annotations:
    fluentbit.io/exclude: "true"
    logging.kubesphere.io/exclude: "true"
spec:
  image: kubesphere/fluent-bit:v1.8.3
  fluentBitConfigName: fluent-bit-config
  priorityClassName: system-node-critical
  resources:
    limits:
      cpu: %{ if vars.cpuLimit != "" }${vars.cpuLimit}%{ else }500m%{ endif }
      memory: %{ if vars.memLimit != "" }${vars.memLimit}%{ else }200Mi%{ endif }
    requests:
      cpu: %{ if vars.cpuRequest != "" }${vars.cpuRequest}%{ else }10m%{ endif }
      memory: %{ if vars.memRequest != "" }${vars.memRequest}%{ else }25Mi%{ endif }
  positionDB:
    hostPath:
      path: /var/lib/fluent-bit/
  tolerations:
    - operator: Exists
