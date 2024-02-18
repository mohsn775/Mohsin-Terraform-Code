# # Create Application Load Balancer
# resource "aws_lb" "Mohsin_alb" {
#   name               = "my-alb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = []
#   subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
# }

# # Output the DNS name of the ALB
# output "alb_dns_name" {
#   value = aws_lb.my_alb.dns_name
# }
