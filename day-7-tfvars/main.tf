module "vpc" {
    source = "./module/vpc"
    vpc_cidr = var.vpc_cidr
    public_subnet_1_az = var.public_subnet_1_az
    public_subnet_2_az =  var.public_subnet_2_az
    public_subnet_1_cidr = var.public_subnet_1_cidr
    public_subnet_2_cidr = var.public_subnet_2_cidr
    sg_name = var.sg_name
}

module "lb" {
    source = "./module/lb"
    vpc_id = module.vpc.vpc_id 
    sg_id = module.vpc.sg_id 
    public_subnet_1_id = module.vpc.public_subnet_id_1 
    public_subnet_2_id = module.vpc.public_subnet_id_2 
    lb_type = var.lb_type
}

module "asg" {
    source = "./module/asg"
    image_id = var.image_id
    key_name = var.key_name
    instance_type = var.instance_type
    sg_id = module.vpc.sg_id
    desired_capacity = var.desired_capacity
    min_size =  var.min_size
    max_size =  var.max_size
    target_arn = module.lb.target_group_arn
    public_subnet_1 = module.vpc.public_subnet_id_1 
    public_subnet_2 = module.vpc.public_subnet_id_2 
}











