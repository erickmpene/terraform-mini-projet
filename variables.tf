variable "prefix_name" {
  description = "le prefix du projet"
}

variable "public_ip_allow" {
  description = "l'adresse ip publique qui peut accéder à l'instance ec2"
}

variable "vpc_cidr_block" {}
variable "private_subnets" {}
variable "public_subnets" {}
variable "az-a" {}
variable "http_port" {}
variable "https_port" {}
variable "ssh_port" {}
variable "ingress_all_ip" {}
variable "egress_all_ip" {}
variable "size_ebs" {}


variable "key_name" {}
variable "ami" {}
variable "instance_type" {}
variable "associate_public_ip_address" {}
variable "ami_owner" {}
variable "ami_owner_name" {}
variable "ami_owner_virtualization_type" {}
variable "ami_owner_root_device_type" {}
