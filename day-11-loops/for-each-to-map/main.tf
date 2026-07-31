resource "aws_instance" "ec2" {
    for_each = tomap({
        server-1 = "t3.micro"
        server-2 = "c7i-flex.large"
        server-3 = "t3.small"
    })
    ami = "ami-028ba4d4ccb4b7b72" 
    instance_type = each.value
    key_name = "my-key-ohio"
    tags = {
        Name = each.key
    }
}




