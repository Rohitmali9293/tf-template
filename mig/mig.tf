# Module Block: Create a single Compute Engine instance
module "tpl" {
  source  = "git::https://github.com/Rohitmali9293/gcp-tfmodule-mig.git"
  for_each = local.mig
  template_name = local.template_name
  mig_name = local.mig_name
  region = var.region
  machine_type = each.value.machine_type
  zones = each.value.zones  
  #firewall_tags = ["allow-ssh", "allow-http"]
  network = each.value.network
  subnetwork = each.value.subnetwork
  disk_size = each.value.disk_size
  image = each.value.image
}
