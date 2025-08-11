<!-- BEGIN_TF_DOCS -->
# Complete

```hcl
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
```

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_msgraph"></a> [msgraph](#requirement\_msgraph) (~> 0.1)

## Resources

No resources.

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_external_domain"></a> [external\_domain](#input\_external\_domain)

Description: The domain name for the external Entra ID tenant

Type: `any`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_external_sponsors"></a> [external\_sponsors](#input\_external\_sponsors)

Description: List of User principal names (UPNs) of external sponsors. Note that for guest accounts in your tenant, the format is <user>\_<external\_domain>#ext#@<initial domain>

Type: `list(string)`

Default: `[]`

### <a name="input_internal_sponsors"></a> [internal\_sponsors](#input\_internal\_sponsors)

Description: List of User principal names (UPNs) of internal sponsors

Type: `list(string)`

Default: `[]`

## Outputs

No outputs.

## Modules

The following Modules are called:

### <a name="module_connected_organization"></a> [connected\_organization](#module\_connected\_organization)

Source: ../../

Version:
<!-- END_TF_DOCS -->