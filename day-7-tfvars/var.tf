#Variable for vpc module
variable "vpc_cidr" {}
variable "public_subnet_1_az" {}
variable "public_subnet_2_az" {}
variable "public_subnet_1_cidr" {}
variable "public_subnet_2_cidr" {}
variable "sg_name" {}

#variables for lb module
variable "lb_type" {}

#variable for autoscling group
variable "image_id" {}
variable "key_name" {}
variable "instance_type" {}
variable "desired_capacity" {}
variable "min_size" {}
variable "max_size" {}
