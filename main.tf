locals {
  addon_yaml = module.kustomize.stdout
}

resource "local_file" "fluentbit" {
  filename = "${path.module}/config/fluentbit.yaml"
  content = templatefile("${path.module}/fluentbit.yaml.tpl", {
    vars = var.fluentbitResources
  })
}

resource "local_file" "kustomize_config" {
  depends_on = [local_file.configs]
  filename   = "${path.module}/config/kustomization.yaml"
  content = templatefile("${path.module}/config_kustomization.yaml.tpl", {
    configs = [for f, c in local_file.configs : "zz_${f}"]
  })
}

resource "local_file" "kustomize_operator" {
  depends_on = [local_file.kustomize_config, local_file.fluentbit]
  filename   = "${path.module}/operator/kustomization.yaml"
  content = templatefile("${path.module}/kustomization.yaml.tpl", {
    namespace      = var.namespace,
    operatorImage  = var.operatorImage,
    operatorTag    = var.operatorTag,
    fluentbitImage = var.fluentbitImage,
    fluentbitTag   = var.fluentbitTag,
  })
}

resource "local_file" "configs" {
  for_each = var.configuration
  filename = "${path.module}/config/zz_${each.key}"
  content  = each.value
}

module "kustomize" {
  depends_on = [local_file.kustomize_operator]
  source     = "matti/outputs/shell"
  version    = "0.2.0"
  command    = "kubectl kustomize ${path.module}/operator"
}
