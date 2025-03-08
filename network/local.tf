locals {
  # Load full YAML file and decode it
  config = lookup(yamldecode(file("../../../project.yml")), terraform.workspace, {})

  network_name = "${terraform.workspace}-network"  # Ensure unique network per workspace

  # Get the workspace-specific configuration
  #workspace_config = lookup(local.full_config, var.workspace_name, {})

  # Extract network and GCE sections
  #network = lookup(local.workspace_config, "network", {})  
  #gce     = lookup(local.workspace_config, "gce", {}) 
  subnets = {
    for name, details in lookup(local.config, "network", {}) :
    "${terraform.workspace}-${name}" => {
      subnet_name = details.subnet_name
      ip_cidr_range = details.ip_cidr_range
      region = details.gcp_region
    }
  }

  firewall_rules = {
    for name, rule in lookup(local.config, "firewall_rules", {}) :
    "${terraform.workspace}-${name}" => {
      direction     = rule.direction
      priority      = rule.priority
      source_ranges = rule.source_ranges
      allowed       = rule.allowed
    }
  }
}
    

/*
  # Extract subnet details
  subnets1 = {
    for name, details in local.subnets1 : 
    name => {
      #vpc_name   = details.vpc_name
      #subnet_name = details.subnet_name
      #gcp_region = details.gcp_region
      subnet_ip_cidr_range = details.ip_cidr_range
    }
  }
}
*/
