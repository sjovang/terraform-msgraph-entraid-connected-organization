<!-- BEGIN_TF_DOCS -->
# Default

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

module "connected_organization" {
  source = "../../"

  external_domain = "contoso.com"
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

No required inputs.

## Optional Inputs

No optional inputs.

## Outputs

No outputs.

## Modules

The following Modules are called:

### <a name="module_connected_organization"></a> [connected\_organization](#module\_connected\_organization)

Source: ../../

Version:
<!-- END_TF_DOCS -->