variable "location" {
  description = "Location of the resourcegroup"
  default     = "ssccentral"
}

variable "rgnames" {
  description = "Array of resource groups names to create"
}

resource "azurestack_resource_group" "rg" {
  for_each = toset(var.rgnames)
  name     = each.key
  location = var.location
}

output "value" {
  value = azurestack_resource_group.rg
}
