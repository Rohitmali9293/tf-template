locals {
  config = lookup(yamldecode(file("../../../project.yml"))["tf-9293-sandbox"], terraform.workspace, {})
  network = lookup(local.config, "network", {})
  gce     = lookup(local.config, "gce", {})
}