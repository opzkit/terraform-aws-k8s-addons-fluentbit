module "fluent" {
  source        = "../../"
  namespace     = "override"
  configuration = { for f in fileset(path.module, "configs/*.yaml") : basename(f) => file(f) }
}

output "yaml" {
  value = module.fluent.addons
}
