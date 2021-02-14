variable "region" {
  description = "Region in which resources are created"
  type        = string
}

variable "profile" {
  description = "AWS profile use"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "custom_tags" {
  description = "Dictionnary of tags associated to ressource"
  type        = map(string)
}
