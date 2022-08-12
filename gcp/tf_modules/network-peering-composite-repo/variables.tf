#variables for network resource
variable "network_peer_name_1" {
  type        = string
  description = "The name of the peer network"
}

variable "network_peer_name_2" {
  type        = string
  description = "The name of the peer network"
}

variable "network_name_1" {
  type        = string
  description = "The name of the first network"
}

variable "network_name_2" {
  type        = string
  description = "The name of the Second network"
}

variable "export_custom_routes_1" {
  type        = string
  description = "Whether network 1 should export custom routes to network 2"
}

variable "import_custom_routes_1" {
  type        = string
  description = "Whether network 1 should import custom routes from network 2"
}

variable "export_custom_routes_2" {
  type        = string
  description = "Whether network 2 should export custom routes to network 1"
}

variable "import_custom_routes_2" {
  type        = string
  description = "Whether network 2 should import custom routes from network 1"
}