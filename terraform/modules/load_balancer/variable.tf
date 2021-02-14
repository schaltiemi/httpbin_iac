variable "region" {
  description = "Region in which resources are created"
  type        = string
}

variable "profile" {
  description = "AWS profile use"
  type        = string
}

variable "app_name" {
  description = "Application's name"
  type        = string
}

variable "public_subnet_ids" {
  description = "Private subnet ids list"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC's id"
  type        = string
}

variable "custom_tags" {
  description = "Dictionnary of tags associated to ressource"
  type        = map(string)
}
