variable "ami" {
  description = "EC2 instance AMI ID"
  default     = "ami-0287a05f0ef0e9d9a"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "availability_zone" {
  description = "The availability zone for the EC2 instance."
  type        = string
  default     = "ap-south-1a"
}

variable "iam_instance_profile" {
  description = "EC2 instance IAM instance profile name"
  default     = " "
}

variable "key_name" {
  description = "EC2 instance key pair name"
  default     = "key_pair"
}

variable "security_groups" {
  description = "Security group for the EC2 instance"
  type        = list(string)
  default     = ["sg-041b222c37b24ca57"]
}

variable "subnet_id" {
  description = "The subnet ID for the EC2 instance"
  default     = "subnet-01b4c3d60dbe562bf"  # Update with a valid subnet ID
}

variable "tags" {
  type    = map(string)
  default = {
    Name        = "TF-Instance"
    Environment = "Dev"
  }
}

variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  type        = bool
  default     = null
}

variable "metadata_options" {
  description = "Customize the metadata options of the instance"
  type        = map(string)
  default = {
    "http_endpoint"               = "enabled"
    "http_put_response_hop_limit" = 1
    "http_tokens"                 = "optional"
  }
}

variable "s3_bucket" {
  type    = string
  default = "pavanssonixbucket1"
}
