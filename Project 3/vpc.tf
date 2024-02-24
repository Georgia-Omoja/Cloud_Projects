# Creates VPC
    resource "aws_vpc" "vpc" {
        cidr_block = var.vpc_cidr
        
        tags = {
            Name = "prestashop-vpc"
        }
    }


# Creates Subnets
    resource "aws_subnet" "public_subnet_1a" {
        vpc_id = aws_vpc.vpc.id
        cidr_block = var.public_subnet_1a_cidr
        availability_zone = us-east-1a
        
        tags = {
            Name = "public-subnet-1a"
        }
    }

# Creates Internet Gateway
    resource "aws_internet_gateway" "igw" {
        vpc_id = aws_vpc.vpc.id

        tags = {
            Name = "prestashop-igw"
        }
    }


# Creates Route Table and subnet association
    resource "aws_route_table" "public_rtb" {
        vpc_id = aws_vpc.vpc.id

        route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
        }

        tags = {
            "Name" = "public-rtb"
        }
    }

    resource "aws_route_table_association" "public" {
        subnet_id = aws_subnet.public_subnet_1a.id
        route_table_id = aws_route_table.public_rtb.id
            
    }


# Creates Security Group for app and database
    resource "aws_security_group" "app-sg" {
        name        = "prestashop-app-sg"
        description = "Allow SSH and HTTP traffic"
        vpc_id      = aws_vpc.vpc.id

        ingress {
            description = "Inbound HTTP traffic"
            from_port   = "80"
            to_port     = "80"
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
        ingress {
            description = "Inbound HTTPS traffic"
            from_port   = "443"
            to_port     = "443"
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
        ingress {
            description = "Inbound SSH traffic"
            from_port   = "22"
            to_port     = "22"
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
        
        egress {
            cidr_blocks = ["0.0.0.0/0"]
            from_port   = "0"
            protocol    = "-1"
            to_port     = "0"
        }
        tags = {
            Name = "prestashop-app-sg"
        }
    }

    resource "aws_security_group" "db-sg" {
        name        = "prestashop-db-sg"
        description = "Allow SSH and MYSQL traffic"
        vpc_id      = aws_vpc.vpc.id

        ingress {
            description = "Inbound HTTP traffic"
            from_port   = "80"
            to_port     = "80"
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
        ingress {
            description = "Inbound HTTPS traffic"
            from_port   = "443"
            to_port     = "443"
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
        ingress {
            description = "Inbound SSH traffic"
            from_port   = "22"
            to_port     = "22"
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
        ingress {
            description = "Inbound MYSQL traffic"
            from_port   = "3306"
            to_port     = "3306"
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        } 

        egress {
            cidr_blocks = ["0.0.0.0/0"]
            from_port   = "0"
            protocol    = "-1"
            to_port     = "0"
        }
        tags = {
            Name = "prestashop-db-sg"
        }
    }