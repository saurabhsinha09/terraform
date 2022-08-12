#Shared configurations
project_id               = "dcn-lz-infra"
lob                      = "cloudops"
env                      = "nonprod"
envp                     = "prod"
vpc_name                 = "vpc-dcn"
subnet_name              = "snet-dcn"
vpc_suffix               = ["dmz", "nondmz"]
ip_cidr_range            = ["10.248.16.0/23", "10.248.18.0/23"]
ip_cidr_rangep           = ["10.248.20.0/22", "10.248.24.0/21"]
subnet_regions           = "asia-south2"
private_ip_google_access = "true"

firewall_name = "fw-dcn-np-clops-ssh-rdp-icmp"
source_ranges = ["10.0.0.0/8"]
target_tags   = ["dcn-np-clops-ssh-rdp-icmp-allow"]

firewall_namep = "fw-dcn-p-clops-ssh-rdp-icmp"
target_tagsp   = ["dcn-p-clops-ssh-rdp-icmp-allow"]

secondary_ip_ranges = [{
  pod-range     = ["10.208.0.0/14"],
  service-range = ["10.212.0.0/20"]
  }, {
  pod-range     = ["10.88.0.0/14"],
  service-range = ["10.92.0.0/20"]
}]

allow_protocol_ports = {
  tcp  = ["22", "3389"]
  icmp = []
}

region                    = "asia-south2"
boot_disk_size            = "50"
image_family              = "debian-11"
image_project             = "debian-cloud"
os_name                   = "debian"
application_name          = "landingzone"
machine_type              = "e2-small"
static_address_project_id = ""
static_address_subnetwork = ""
tags                      = ["dcn-np-clops-ssh-rdp-icmp-allow"]
deletion_protection       = false

vm_instance_name = "lz-cops-as2a"
zone             = "asia-south2-a"

supplement_disks = {
  app = {
    size = 10
    type = "pd-standard"
    labels = {
      purpose = "infra_app"
    }
  },
  data = {
    size = 50
    type = "pd-standard"
    labels = {
      purpose = "infra_data"
    }
  }
}