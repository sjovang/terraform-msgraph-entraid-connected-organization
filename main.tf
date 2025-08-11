data "msgraph_resource" "external_tenant_id" {
  url = "tenantRelationships/findTenantInformationByDomainName(domainName='${var.external_domain}')"
  response_export_values = {
    default_domain_name = "defaultDomainName"
    display_name        = "displayName"
    tenant_id           = "tenantId"
  }
}

resource "msgraph_resource" "connected_organization" {
  url = "identityGovernance/entitlementManagement/connectedOrganizations"
  body = {
    displayName = data.msgraph_resource.external_tenant_id.output.display_name
    description = "Test connected organization with terraform-provider-msgraph"
    identitySources = [
      {
        "@odata.type" = "#microsoft.graph.azureActiveDirectoryTenant"
        tenantId      = data.msgraph_resource.external_tenant_id.output.tenant_id
      }
    ]
    state = "configured"
  }
  response_export_values = {
    id = "id"
  }
}

data "msgraph_resource" "internal_sponsors" {
  for_each = var.internal_sponsors != [] ? { for upn in var.internal_sponsors : upn => upn } : {}
  url      = "users/${each.key}"
  response_export_values = {
    id = "id"
  }
}

resource "msgraph_resource" "internal_sponsors" {
  url      = "identityGovernance/entitlementManagement/connectedOrganizations/${msgraph_resource.connected_organization.output.id}/internalSponsors/$ref"
  for_each = data.msgraph_resource.internal_sponsors != {} ? data.msgraph_resource.internal_sponsors : {}
  body = {
    "@odata.id" = "https://graph.microsoft.com/v1.0/users/${each.value.output.id}"
  }
}

data "msgraph_resource" "external_sponsors" {
  for_each = var.external_sponsors != [] ? { for upn in var.external_sponsors : upn => upn } : {}
  url      = "users/${replace(each.key, "#", "%23")}"
  response_export_values = {
    id = "id"
  }
}

resource "msgraph_resource" "external_sponsors" {
  url      = "identityGovernance/entitlementManagement/connectedOrganizations/${msgraph_resource.connected_organization.output.id}/externalSponsors/$ref"
  for_each = data.msgraph_resource.external_sponsors != {} ? data.msgraph_resource.external_sponsors : {}
  body = {
    "@odata.id" = "https://graph.microsoft.com/v1.0/users/${each.value.output.id}"
  }
}