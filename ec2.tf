resource "aws_instance" "example" {
  ami           = "ami-0b4f379183e5706b9"
  instance_type = "t2.micro"

}

resource "aws_security_group" "Roboshop_all" {
  name        = "Roboshop_all_aws"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "Roboshop_all" {
  security_group_id = aws_security_group.Roboshop_all.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "Roboshop_all" {
  security_group_id = aws_security_group.Roboshop_all.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}