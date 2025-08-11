terraform {
  required_providers {
    msgraph = {
      source  = "microsoft/msgraph"
      version = "~> 0.1"
    }
  }
}

provider "msgraph" {}

module "connected_organization" {
  source = "../../"

  external_domain = "contoso.com"
}