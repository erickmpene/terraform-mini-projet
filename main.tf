provider "aws" {
  region = "eu-west-3"
}

module "ec2" {
  source                        = "./modules/ec2"
  prefix_name                   = var.prefix_name
  vpc_id                        = module.vpc.vpc_id
  ami                           = var.ami
  instance_type                 = var.instance_type
  key_name                      = var.key_name
  subnet_id                     = module.vpc.public_subnets
  associate_public_ip_address   = var.associate_public_ip_address
  vpc_security_group_ids        = ["${module.sg.sg_allow_https}", "${module.sg.sg_allow_http}", "${module.sg.sg_allow_ssh}"]
  ebs                           = module.ebs.ebs
  ami_owner                     = var.ami_owner
  ami_owner_name                = var.ami_owner_name
  ami_owner_virtualization_type = var.ami_owner_virtualization_type
  ami_owner_root_device_type    = var.ami_owner_root_device_type

}

module "vpc" {
  source          = "./modules/vpc"
  prefix_name     = var.prefix_name
  vpc_cidr_block  = var.vpc_cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  az-a            = var.az-a

}

module "ebs" {
  source      = "./modules/ebs"
  az-a        = var.az-a
  size_ebs    = var.size_ebs
  prefix_name = var.prefix_name
}

module "eip" {
  source       = "./modules/eip"
  ec2_instance = module.ec2.ec2
  prefix_name  = var.prefix_name

}

module "sg" {
  source         = "./modules/sg"
  prefix_name    = var.prefix_name
  http_port      = var.http_port
  https_port     = var.https_port
  vpc_id         = module.vpc.vpc_id
  ingress_all_ip = var.ingress_all_ip
  egress_all_ip  = var.egress_all_ip
  ssh_port       = var.ssh_port

}
# module "lb" {
#   source             = "./modules/lb"
#   prefix_name        = var.prefix_name
#   public_ip_allow    = var.public_ip_allow
#   subnets-a          = module.vpc.subnet_webservers-a
#   subnets-b          = module.vpc.subnet_webservers-b
#   vpc_id             = module.vpc.vpc_id
#   lb_port            = var.lb_port
#   instances-a        = module.ec2.webservers-a
#   instances-b        = module.ec2.webservers-b
#   load_balancer_type = var.load_balancer_type
#   target_type        = var.target_type
# }





