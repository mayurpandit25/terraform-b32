resource "aws_instance" "ec2" {
    ami = "ami-028ba4d4ccb4b7b72"
    instance_type = "t3.micro"
    depends_on = [ aws_s3_bucket.s3 ]
    tags = {
        Name = "ec2_instance"
    }
}

resource "aws_s3_bucket" "s3" {
    bucket = "mayurcbz.space"

    tags = {
        Name = "mayurcbz.space"
    }
}
