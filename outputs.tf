output "connected_organization_id" {
  value = msgraph_resource.connected_organization.output.id
  description = "The ID of the connected organization created in Microsoft Graph."
}