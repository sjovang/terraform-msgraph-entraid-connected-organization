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