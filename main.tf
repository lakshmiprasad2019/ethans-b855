terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.65.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}
resource "aws_vpc" "myvpc" {
  cidr_block = "10.10.0.0/16"
}
resource "aws_subnet" "Public" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.10.1.0/24"

  tags = {
    Name = "Public"
  }
}
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.10.4.0/24"

  tags = {
    Name = "Private"
  }
}
resource "aws_subnet" "private-1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.10.3.0/24"

  tags = {
    Name = "Private-1"
  }
}
output "private-azvalue" {
    value = aws_subnet.private.availability_zone
  
}
output "private-1-azvalue" {
    value = aws_subnet.private-1.availability_zone
    sensitive = true  
  
}
