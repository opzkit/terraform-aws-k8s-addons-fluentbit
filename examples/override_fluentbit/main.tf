module "fluent" {
  source         = "../../"
  namespace      = "override"
  configuration  = { for f in fileset(path.module, "configs/*.yaml") : basename(f) => file(f) }
  fluentbitImage = "fluentbitImage"
  fluentbitTag   = "fluentbitTag"
  fluentbitResources = {
    memLimit : "1Pi",
    memRequest : "0",
    cpuLimit : "2",
    cpuRequest : "0.1"
  }
}

output "yaml" {
  value = module.fluent.addons
}
