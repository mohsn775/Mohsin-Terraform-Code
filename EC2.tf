# resource "aws_instance" "S1"  {
#   ami           = "ami-01a7d95ecd129c2f1"
#   instance_type = "t2.micro"
#   availability_zone = "us-west-2a"
#   tags = {
#     Name = "Server1"
#   }
# }


resource "aws_instance" "S1"  {
  ami           = "ami-01a7d95ecd129c2f1"
  instance_type = "t2.micro"
  availability_zone = "us-west-2a"
  subnet_id      = aws_subnet.Pvt-Sub3.id
  tags = {
    Name = "Web-Server1"
  }
}



