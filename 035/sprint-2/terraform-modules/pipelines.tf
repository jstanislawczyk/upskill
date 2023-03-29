module "first_tenant_pipeline" {
  source = "./pipeline"

  environment = local.environment
  tenant      = "FirstTenant"
}

module "second_tenant_pipeline" {
  source = "./pipeline"

  environment = local.environment
  tenant      = "SecondTenant"
}

