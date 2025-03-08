locals {
  # Load full YAML file and decode it
  config = lookup(yamldecode(file("../../../project.yml")), terraform.workspace, {})

  instance_name = "${terraform.workspace}-instance"  # Ensure unique instance per workspace

  # Get the workspace-specific configuration
  #workspace_config = lookup(local.full_config, var.workspace_name, {})

  # Extract network and GCE sections
  #network = lookup(local.workspace_config, "network", {})  
  #gce = lookup(local.config, "gce", {})      

  # Extract subnet details
  instance = {
    for name, details in lookup(local.config, "gce", {}) :
    "${terraform.workspace}-${name}" => {
      #instance_name = details.instance_name
      machine_type = details.machine_type
      zone = details.zone
      disk_size = details.disk_size
      image = details.image
      subnetwork = details.subnetwork
      firewall_tags = details.firewall_tags
    }
  }
}