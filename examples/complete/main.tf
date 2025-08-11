terraform {
  required_providers {
    msgraph = {
      source  = "microsoft/msgraph"
      version = "~> 0.1"
    }
  }
}

provider "msgraph" {}

variable "external_domain" {
  description = "The domain name for the external Entra ID tenant"
}

variable "internal_sponsors" {
  default     = []
  description = "List of User principal names (UPNs) of internal sponsors"
  type        = list(string)
}

variable "external_sponsors" {
  default     = []
  description = "List of User principal names (UPNs) of external sponsors. Note that for guest accounts in your tenant, the format is <user>_<external_domain>#ext#@<initial domain>"
  type        = list(string)
}

module "connected_organization" {
  source = "../../"

  external_domain   = "contoso.com"
  external_sponsors = var.external_sponsors
  internal_sponsors = var.internal_sponsors
}

output "id" {
  value       = module.connected_organization.connected_organization_id
  description = "The ID of the connected organization created in Microsoft Graph."
}