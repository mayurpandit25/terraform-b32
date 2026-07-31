resource "aws_instance" "my_instance" {
    ami = "ami-028ba4d4ccb4b7b72"
    instance_type = "t3.micro"
    key_name = "my-key-ohio"
    count = 5
    tags = {
        Name = "my-instance"
    }
}

