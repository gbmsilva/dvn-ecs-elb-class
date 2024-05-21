resource "aws_lb" "this" {
  name               = "devops-na-nuvem-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public_1a.id, aws_subnet.public_1b.id]
}
