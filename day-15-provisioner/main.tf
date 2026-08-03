resource "aws_instance" "example" { 
  instance_type   = "t3.micro" 
  ami             = "ami-028ba4d4ccb4b7b72" 
  key_name        = "my-key-ohio" 
  vpc_security_group_ids = ["sg-0c98b6b2580462b01"] 
 
  provisioner "file" { 
    source         = "hello.txt" 
    destination = "/home/ec2-user/hello.txt" 
  } 
 
  provisioner "local-exec" { 
    command = "echo ${self.private_ip} >> private_ips.txt" 
  } 
 
  connection { 
    type        = "ssh" 
    user        = "ec2-user" 
    private_key = file("${path.module}/my-key-ohio.pem") 
    host        = self.public_ip 
  } 
 
  provisioner "remote-exec" { 
    inline = [ 
    "sudo yum install httpd -y", 
    "sudo systemctl start httpd", 
    "sudo systemctl enable httpd" 
    ] 
  } 
} 
