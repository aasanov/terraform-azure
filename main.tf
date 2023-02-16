
provider "azurerm" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.TF_VAR_clientsecret
  features {}
}
terraform {
  backend "azurerm" {
    storage_account_name = "AccountName"
    container_name       = "tfstate"
    key                  = "ResourceName.terraform.tfstate"
    sas_token            = "SASToken"
  }
}
resource "azurerm_resource_group" "ResourceGroup" {
  name     = "ResourceName"
  location = "northcentralus"
}
module "azurerm_function_app" {
  source              = "../../modules/Function-App"
  resource_group_name = azurerm_resource_group.ResourceGroup.name
  function_app_name   = "Terraform"
  env_tag             = "prod"
  app_tag             = "Web"
  asp_size            = "S1"
  asp_tier            = "Consumption"
  depends_on = [azurerm_resource_group.ResourceGroup]
}
