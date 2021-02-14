variable "region" {
  description = "Region in which resources are created"
  type        = string
}

variable "profile" {
  description = "AWS profile use"
  type        = string
}

variable "vpc_id" {
  description = "Main VPC's id"
  type        = string
}

variable "subnets_cidr_block" {
  description = <<EOF
    List of cidr blocks for each subnet,
    if 2 subnets to create -> 2 elements in list
    ex: ["10.0.1.0/24", "10.0.2.0/24"]
    EOF
  type        = list(string)
}

variable "custom_tags" {
  description = "Dictionnary of tags associated to ressource"
  type        = map(string)
}