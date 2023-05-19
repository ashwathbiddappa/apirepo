provider "aws"{
region=" "
acess_key =" "
secret_key=""
}

resource "aws_instance" "instance" {
  ami           = "ami"
  instance_type = "instance-type"
  key_name      = "key-pair"
vpc_security_group_ids = aws_security_group.sg.id
  key_name = "key-name"

  # Use user_data to run commands on instance launch
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y docker

    sudo service docker start
    aws ecr get-login-password --region region | sudo docker login --username username --password-stdin ecr-repo-url

    sudo docker pull your-ecr-repo-url/docker-image
    sudo docker run -d -p 8080:8080 ecr-repo-url/docker-image

  EOF

}
resourec "aws_resource_key" "keypair" {

key_name =" "
public_key=" "
}


resource "aws_security_group" "port" {
  name        = "sg"
  description = "Security group for Docker container"
  
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
