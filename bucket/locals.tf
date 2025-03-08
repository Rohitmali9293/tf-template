locals {
  config = lookup(yamldecode(file("../../project.yml"))["resource"],terraform.workspace, {})
  vpc = lookup(local.config, "network", {})
  instance = lookup(local.config, "instance", {})
  buckets = lookup(local.config, "buckets", {})
}