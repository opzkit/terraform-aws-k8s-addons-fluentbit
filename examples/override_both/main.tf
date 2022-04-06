module "fluent" {
  source         = "../../"
  namespace      = "override"
  configuration  = { for f in fileset(path.module, "configs/*.yaml") : basename(f) => file(f) }
  operatorImage  = "operatorImage"
  operatorTag    = "operatorTag"
  fluentbitImage = "fluentbitImage"
  fluentbitTag   = "fluentbitTag"
}

output "yaml" {
  value = module.fluent.addon
}
