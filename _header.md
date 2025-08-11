# terraform-msgraph-entraid-connected-organization

A small module to add an external Entra ID tenant as a [connected organization](https://learn.microsoft.com/en-us/entra/id-governance/entitlement-management-organization)

> [!IMPORTANT]
> This module is using [terraform-provider-msgraph](https://registry.terraform.io/providers/microsoft/msgraph/latest). This provider is currently in preview, and while this module has been tested and works fine, there might be breaking changes

## Required permissions

### Application

* `CrossTenantInformation.ReadBasic.All` - Look up tenant id for the external Entra ID tenant
* `EntitlementManagement.ReadWrite.All` - Create connected organization and adding external/internal sponsors
* `User.Read.All` - Read user objects for external/internal sponsors