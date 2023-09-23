terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.67.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"  
}

resource "aws_lightsail_instance" "samplelightsail_instance" {
  name              = "centos-instance"
  availability_zone = "us-east-1a"  
  blueprint_id      = "centos_7_2009_01"
  bundle_id         = "micro_2_0"

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install unzip wget httpd -y
    sudo wget https://github.com/utrains/static-resume/archive/refs/heads/main.zip
    sudo unzip main.zip
    sudo rm -rf /var/www/html/*
    sudo cp -r static-resume-main/* /var/www/html/
    sudo systemctl start httpd
    sudo systemctl enable httpd
    EOF

  tags = {
    "Environment" = "Development"
  }
}