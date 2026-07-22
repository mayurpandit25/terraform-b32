resource "aws_instance" "ec2" {
    ami           = "ami-078fe7ff43e10cf8c"
    instance_type = "t3.micro"
    key_name      = "my-key-ohio"
    count         = 2
    disable_api_termination = false 
    vpc_security_group_ids = ["sg-0c98b6b2580462b01"]
    
    user_data = <<-EOF
                #!/bin/bash
                sudo dnf update
                sudo dnf install httpd -y
                sudo systemctl enable httpd.service
                sudo systemctl start httpd.service
                sudo echo "<h1> Welcome to terraform </h1>" > /var/www/html/index.html
                EOF

    root_block_device {
        volume_size = 8
        volume_type = "gp3"
    }

    tags = {
        Name = "webserver"
    }
}
