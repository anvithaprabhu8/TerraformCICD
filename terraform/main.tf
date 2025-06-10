terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = var.aws_region
}


resource "aws_vpc" "terraform_cicd_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "terraform_cicd_vpc"
  }  

}


resource "aws_subnet" "terraform_cicd_subnet" {
  vpc_id     = aws_vpc.terraform_cicd_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone="us-east-1a"

  tags = {
    Name = "terraform_cicd_subnet"
  }

}

resource "aws_instance" "terraform_cicd_ec2" {
  ami           = var.aws_ami
  instance_type = var.aws_instance_type
  subnet_id     = aws_subnet.terraform_cicd_subnet.id
  
  tags = {
    Name = "terraform_cicd_ec2"
  }

}