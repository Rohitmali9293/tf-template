# Resource: VPC
resource "google_compute_network" "myvpc" {
  for_each = local.network
  name = "var.project_name-var.region_name-vpc"
  auto_create_subnetworks = false
}

# Resource: Subnet
resource "google_compute_subnetwork" "mysubnet" {
  for_each = local.network
  name = each.value.subnet_name
  #region = local.config.gcp_region1
  ip_cidr_range = each.value.ip_cidr_range
  network = google_compute_network.myvpc[each.key].id
}
