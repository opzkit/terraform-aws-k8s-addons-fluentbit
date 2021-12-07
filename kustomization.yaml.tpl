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
