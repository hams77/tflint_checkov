provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ebs_optimized = true
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  iam_instance_profile   = var.iam_instance_profile
  key_name               = var.key_name
  security_groups        = var.security_groups
  subnet_id              = var.subnet_id
  tags                   = var.tags
  monitoring           =   true
  dynamic "metadata_options" {
    for_each = length(var.metadata_options) > 0 ? [var.metadata_options] : []

    content {
      http_endpoint               = try(metadata_options.value.http_endpoint, "enabled")
      http_tokens                 = try(metadata_options.value.http_tokens, "optional")
      http_put_response_hop_limit = try(metadata_options.value.http_put_response_hop_limit, 1)
      instance_metadata_tags      = try(metadata_options.value.instance_metadata_tags, null)
    }
  }
}
