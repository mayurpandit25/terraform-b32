module "vpc" {
    source = "./module/vpc"
    vpc_cidr = "10.0.0.0/16"
    public_subnet_1_az = "us-east-2a"
    public_subnet_2_az =  "us-east-2b"
    public_subnet_1_cidr = "10.0.0.0/24"
    public_subnet_2_cidr = "10.0.1.0/24"
    sg_name = "my-security-group" 
}

module "lb" {
    source = "./module/lb"
    vpc_id = module.vpc.vpc_id 
    sg_id = module.vpc.sg_id 
    public_subnet_1_id = module.vpc.public_subnet_id_1 
    public_subnet_2_id = module.vpc.public_subnet_id_2 
    lb_type = "application"
}

module "asg" {
    source = "./module/asg"
    image_id = "ami-028ba4d4ccb4b7b72"
    key_name = "my-key-ohio"
    instance_type = "t3.micro"
    sg_id = module.vpc.sg_id
    desired_capacity = 2 
    min_size =  2
    max_size =  5
    target_arn = module.lb.target_group_arn
    public_subnet_1 = module.vpc.public_subnet_id_1 
    public_subnet_2 = module.vpc.public_subnet_id_2 
}








