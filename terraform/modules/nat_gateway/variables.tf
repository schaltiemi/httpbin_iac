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

variable "public_subnet_ids" {
  description = "Public subnet's id"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "Private subnet's ids"
  type        = list(string)
}

variable "custom_tags" {
  description = "Dictionnary of additional tags"
  type        = map(string)
}
