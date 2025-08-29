variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "vpc_name" {
  type        = string
  description = "Name tag for the VPC"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for the public subnet"
}

variable "az" {
  type        = string
  description = "Availability zone for the subnet"
}

variable "sg_name" {
  type        = string
  description = "Name for the security group"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}