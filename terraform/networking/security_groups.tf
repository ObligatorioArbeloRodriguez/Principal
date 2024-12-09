#resource "aws_security_group" "ecs" {
#  name   = "ecs-sg"
#  #vpc_id = aws_vpc.main.id
#  vpc_id = data.aws_vpc.main.id

#  ingress {
#    from_port   = 8080
#    to_port     = 8080
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#    security_groups = [aws_security_group.lb.id]
#  }

#  egress {
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#}


#resource "aws_security_group" "lb" {
#  name   = "lb-sg"
#  #vpc_id = aws_vpc.main.id
#  vpc_id = data.aws_vpc.main.id

#  ingress {
#    from_port   = 8080 #Cambie de 80 para probar
#    to_port     = 8080 #Cambie de 80 para probar
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }

#  egress {
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#}

