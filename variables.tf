variable "subscription" {
  description = "Azure Tenant Subscription ID"
  type    = string
  default = "subscriptionID"
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type    = string
  default = "tenantID"
}

variable "client_id" {
  description = "Service Principal App ID"
  type    = string
  default = "clientID"
}

variable "client_secret" {
  description = "Service Principal Password"
  type    = string
  default = "clientsecret"
}