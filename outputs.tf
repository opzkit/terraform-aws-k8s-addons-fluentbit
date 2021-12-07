output "addon" {
  value = {
    content = local.addon_yaml
    version = "0.12.1"
    name    = "fluentbit-operator"
  }
}
