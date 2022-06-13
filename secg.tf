# creating security groups  for http and ssh


resource "aws_security_group" "Test-sec-group" {
  name        = "Test - sec-group"
  description = "Allow TLS inbound traffic "
  vpc_id      = aws_vpc.Prod-rock-VPC.id

  ingress {
    description = "security group with ingress HTTP port opeened"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }



  ingress {
    description = "security group with ingress  SSH port opeened "
    from_port   = 20
    to_port     = 20
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }



  egress {
    description = "security group with ingress  SSH port opeened "
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# creating security group with bastion-host






