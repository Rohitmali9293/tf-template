locals {
  # Load full YAML file and decode it
  config = lookup(yamldecode(file("../../project.yml")), terraform.workspace, {})

  template_name = "${terraform.workspace}-template"
  mig_name = "${terraform.workspace}-mig"

  mig = {
    for name, details in lookup(local.config, "mig", {}) :
    "${terraform.workspace}-${name}" => {
      #instance_name = details.instance_name
      #template_name = details.template_name
      machine_type = details.machine_type
      zones = details.zones
      disk_size = details.disk_size
      image = details.image
      network = details.network
      subnetwork = details.subnetwork
      #firewall_tags = details.firewall_tags
    }
  }
}