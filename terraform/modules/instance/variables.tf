variable "region" {
  description = "region in which resources are created"
  type        = string
}

variable "profile" {
  description = "AWS profile use"
  type        = string
}

variable "instance_name" {
  description = "Instance's name"
  type        = string
}

variable "app_desired_capacity" {
  description = "Desired number of instances up"
  type        = number
}

variable "max_autoscaling_group_size" {
  description = "Max number of instances up"
  type        = number
}

variable "min_autoscaling_group_size" {
  description = "Min number of instances up"
  type        = number
}

variable "private_subnet_ids" {
  description = "Private subnet ids list"
  type        = list(string)
}

variable "image_id" {
  description = "ami id"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "vpc_id" {
  description = "VPC's id"
  type        = string
}

variable "custom_tags" {
  description = "Dictionnary of tags associated to ressource"
  type        = map(string)
}

variable "http_target_group_arn" {
  description = "ARN of http target group in LB"
  type        = string
}

variable "loab_balancer_sg_id" {
  description = "Load balancer security group's id"
  type        = string
}