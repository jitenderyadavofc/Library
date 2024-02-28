variable "instance_count" {
  description = "Number of instances to create"
  type        = number
}

variable "instance_type" {
  description = "Type of EC2 instances"
  type        = string
}

variable "ebs_volume_size" {
  description = "Size of the EBS volume in gigabytes"
  type        = number
}

variable "aws_region" {
  description = "name of the region"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the instances"
  type        = string
  default     = "ami-0440d3b780d96b29d"

}

variable "instance_names" {
  description = "Names of the instances"
  type        = list(string)
  #default     = []
}

variable "ssh_cidr_blocks" {
  description = "CIDR blocks allowed SSH access"
  type        = list(string)
  default     = ["0.0.0.0/0"] # Default to allow SSH access from anywhere
}

