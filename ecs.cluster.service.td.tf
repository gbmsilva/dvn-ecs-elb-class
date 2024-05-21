resource "aws_ecs_task_definition" "this" {
  family                   = "devops-na-nuvem-ecs-portal-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "portal",
    "image": "968225077300.dkr.ecr.us-east-1.amazonaws.com/devops-na-nuvem-week/production/frontend",
    "cpu": 1024,
    "memory": 2048,
    "essential": true,
    "portMappings": [
        {
          "containerPort": 80,
          "hostPort": 80
        }
    ],
    "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
            "awslogs-group": "/aws/devop-na-nuvem-ecs-cluster/log-group",
            "awslogs-region": "us-east-1",
            "awslogs-create-group": "true",
            "awslogs-stream-prefix": "ecs"
        }
    }
  }
]
TASK_DEFINITION
}
