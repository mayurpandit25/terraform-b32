provider "aws" {
    region = "us-east-2"
    profile = "dev"
}

terraform {
  backend "s3" {
    bucket = "mayurcbz.space"
    region = "us-east-2"
    key    = "terraform.tfstate"
    profile = "dev"
    use_lockfile = true 
    shared_credentials_files = [ "/root/.aws/credetials" ]   
  }
}



