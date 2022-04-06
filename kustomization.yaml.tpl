apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

resources:
- namespace-namespace.yaml
- fluentbit-operator-clusterRoleBinding.yaml
- fluentbit-operator-deployment.yaml
- fluentbit-operator-crd.yaml
- fluentbit-operator-clusterRole.yaml
- fluentbit-operator-serviceAccount.yaml
- ../config

namespace: ${namespace}

%{ if operatorImage != "" }
images:
- name: kubesphere/fluentbit-operator
  newName: ${operatorImage}
  newTag: %{ if operatorTag != "" }${operatorTag}%{ else }latest%{ endif }
%{ endif }

%{ if fluentbitImage != "" }
transformers:
- |-
  apiVersion: builtin
  kind: ImageTagTransformer
  metadata:
    name: not-important-here
  imageTag:
    name: kubesphere/fluent-bit
    newName: ${fluentbitImage}
    newTag: %{ if fluentbitTag != "" }${fluentbitTag}%{ else }latest%{ endif }
  fieldSpecs:
    - path: spec/image
      kind: FluentBit

%{ endif }
