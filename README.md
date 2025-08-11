<!-- BEGIN_TF_DOCS -->
# terraform-msgraph-connected-organization

A small module to add an external Entra ID tenant as a [connected organization](https://learn.microsoft.com/en-us/entra/id-governance/entitlement-management-organization)

> [!IMPORTANT]
> This module is using [terraform-provider-msgraph](https://registry.terraform.io/providers/microsoft/msgraph/latest). This provider is currently in preview, and while this module has been tested and works fine, there might be breaking changes

## Required permissions

### Application

* `CrossTenantInformation.ReadBasic.All` - Look up tenant id for the external Entra ID tenant
* `EntitlementManagement.ReadWrite.All` - Create connected organization and adding external/internal sponsors
* `User.Read.All` - Read user objects for external/internal sponsors

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_msgraph"></a> [msgraph](#requirement\_msgraph) (~> 0.1)

## Resources

The following resources are used by this module:

- [msgraph_resource.connected_organization](https://registry.terraform.io/providers/microsoft/msgraph/latest/docs/resources/resource) (resource)
- [msgraph_resource.external_sponsors](https://registry.terraform.io/providers/microsoft/msgraph/latest/docs/resources/resource) (resource)
- [msgraph_resource.internal_sponsors](https://registry.terraform.io/providers/microsoft/msgraph/latest/docs/resources/resource) (resource)
- [msgraph_resource.external_sponsors](https://registry.terraform.io/providers/microsoft/msgraph/latest/docs/data-sources/resource) (data source)
- [msgraph_resource.external_tenant_id](https://registry.terraform.io/providers/microsoft/msgraph/latest/docs/data-sources/resource) (data source)
- [msgraph_resource.internal_sponsors](https://registry.terraform.io/providers/microsoft/msgraph/latest/docs/data-sources/resource) (data source)

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

No modules.
<!-- END_TF_DOCS -->