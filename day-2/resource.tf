resource "aws_instance" "ec2" {
    ami           = "ami-078fe7ff43e10cf8c"
    instance_type = "t3.micro"
    key_name      = "my-key-ohio"
    disable_api_termination = false 
    vpc_security_group_ids = ["sg-0c98b6b2580462b01"]
    user_data = file("/root/terraform-b32/day-2/user-data.sh")

    root_block_device {
        volume_size = 8
        volume_type = "gp3"
    }

    tags = {
        Name = "webserver"
    }
}
