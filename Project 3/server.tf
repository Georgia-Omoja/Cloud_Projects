# Creates App and DB EC2 INSTANCES
resource "aws_instance" "app-server" {
  instance_type          = var.ec2_instance_type
  ami                    = var.ec2_ami
  key_name               = "globalKeypair"
  vpc_security_group_ids = [aws_security_group.app-sg.id]
  subnet_id              = aws_subnet.public_subnet_1a.id
  associate_public_ip_address = true
    tags = {
      Name = "prestashop-app-server"
    }
}

resource "aws_instance" "db-server" {
  instance_type          = var.ec2_instance_type
  ami                    = var.ec2_ami
  key_name               = "globalKeypair"
  vpc_security_group_ids = [aws_security_group.db-sg.id]
  subnet_id              = aws_subnet.public_subnet_1a.id
  associate_public_ip_address = true
    tags = {
      Name = "prestashop-db-server"
    }
}