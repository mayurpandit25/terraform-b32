provider "aws" {
    region = "us-east-2"
    profile = "dev"
}

resource "aws_s3_bucket" "s3" {
    bucket = "mayurcbz.space"

    tags = {
        Name = "mayurcbz.space"
    }

    lifecycle {
      prevent_destroy = true 
    }
}

