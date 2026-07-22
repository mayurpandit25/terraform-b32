resource "aws_instance" "ec2" {
    ami           = var.ami
    instance_type = var.instance_type
    key_name      = var.key_name 
    disable_api_termination = false 
    vpc_security_group_ids = [var.sg_id]
    user_data = file("/root/terraform-b32/day-2/user-data.sh")

    root_block_device {
        volume_size = var.volume_size
        volume_type = var.volume_type
    }

    tags = var.tags

}
