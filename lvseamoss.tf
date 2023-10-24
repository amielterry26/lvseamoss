resource "aws_instance" "web1" {
  ami           = "ami-0e641a30ed7da3a07"
  instance_type = "t2.micro"

  key_name = "lvseamoss"
  vpc_security_group_ids = [aws_security_group.lvseamosssg.id]
  tags = {
    Name = "lvseamossserver"
  }
}

resource "aws_security_group" "lvseamosssg" {
  name        = "home"
  description = "Allow Vegas home traffic"

  ingress {
    description      = "traffic from Vegas"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["71.38.213.119/32"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "vegas home"
  }
}
