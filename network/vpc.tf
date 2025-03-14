# Resource: VPC
module "myvpc" {
  source  = "https://github.com/Rohitmali9293/gcp-tfmodule-netowrk.git"
  network_name = local.network_name
  project_id = var.project_name
  subnets = local.subnets
  firewall_rules = local.firewall_rules
}


/*
# Resource: Subnet
module "mysubnet" {
  source  = "../../../tf-modules/gcp/vpc"
  for_each = local.subnets
  subnet_name = "${var.region}-${var.workspace_name}"
  #region = each.value.gcp_region
  subnet_ip_cidr_range = each.value.subnet_ip_cidr_range
  network = module.myvpc.id
}

resource "google_compute_firewall" "fw_ssh" {
  #for_each = local.network
  name = "${var.workspace_name}-allow-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = module.myvpc.id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh-tag"]
}

# Firewall Rule: HTTP Port 80
resource "google_compute_firewall" "fw_http" {
  #for_each = local.network
  name = "${var.workspace_name}-allow-http"
  allow {
    ports    = ["80"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = module.myvpc.id 
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["webserver-tag"]
}
*/
