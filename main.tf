terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  profile = "default"
  region = "us-east-1"
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
  ami           = "ami-0953476d60561c955"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.terraform_cicd_subnet.id
  
  tags = {
    Name = "terraform_cicd_ec2"
  }

}