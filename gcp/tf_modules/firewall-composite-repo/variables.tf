#variables for firewall
variable "name" {
  type        = string
  description = "The name of the firewall rule"
}

variable "project" {
  type        = string
  description = "The project ID where the firewall will be created"
}

variable "network" {
  type        = string
  description = "The network name for firewall"
}

variable "priority" {
  type        = string
  description = "The priority of the rule"
  default     = "1000"
}

variable "direction" {
  type        = string
  description = "The direction of traffic to which this firewall applies"
  default     = "INGRESS"
}

/*variable "disabled" {
  type        = bool
  description = "Whether to disable firewall run"
  default     = false
}*/

variable "description" {
  type        = string
  description = "The description of each firewall rule"
  default     = "This firewall rule does not have any description"
}

variable "allow_protocol_ports" {
  description = "The map of protcol and port ranges."
  type        = map(list(string))
  default     = {}
}

variable "deny_protocol_ports" {
  description = "The map of protcol and port ranges."
  type        = map(list(string))
  default     = {}
}

variable "source_tags" {
  type        = list
  description = "The list of source tags"
  default     = []
}

variable "target_tags" {
  type        = list
  description = "The list of target tags"
  default     = []
}

variable "source_ranges" {
  type        = list
  description = "A list of source CIDR ranges that this firewall applies to"
  default     = []
}

variable "destination_ranges" {
  type        = list
  description = "A list of target CIDR ranges that this firewall applies to"
  default     = []
}

/*
variable "source_service_accounts" {
  type        = list
  description = "The firewall will apply only to traffic originating from an instance with a source service account "
  default     = []
}

variable "target_service_accounts" {
  type        = list
  description = "A service account is indicating instance located in network that may make network connections"
  default     = []
}
*/

variable "enable_logs" {
  type        = bool
  description = "Enable firewall rule logs"
  default     = true
}

variable "log_metadata" {
  type        = string
  description = "Flow logs metadata"
  default     = "INCLUDE_ALL_METADATA"
}