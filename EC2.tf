# creating a server for eu-west-2 region

resource "aws_instance" "Test-server1" {
  ami                         = "ami-0758d98b134137d18"
  instance_type               = "t2.micro"
  key_name                    = "kell1980"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.Test-sec-group.id]
  subnet_id                   = aws_subnet.Test-public-sub_1.id
  availability_zone           = var.AZ1

  tags = {
    Name = "Test-server1"
  }
}





resource "aws_instance" "Test-server2" {
  ami                         = "ami-0758d98b134137d18"
  instance_type               = "t2.micro"
  key_name                    = "kell1980"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.Test-sec-group.id]
  subnet_id                   = aws_subnet.Test-priv-sub_1.id
  availability_zone           = var.AZ3


  tags = {
    Name = "Test-server2"
  }
}

