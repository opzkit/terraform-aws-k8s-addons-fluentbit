apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

resources:
- fluentbit.yaml
- fluentbit-config.yaml
- input-tail.yaml
- input-systemd-container.yaml
- input-systemd-kubelet.yaml
- filter-kubernetes.yaml
- filter-systemd.yaml
- filter-containerd.yaml
- fluentbit-containerd-config.yaml
- systemd-lua-config.yaml
%{ for c in configs ~}
- ${c}
%{ endfor ~}

