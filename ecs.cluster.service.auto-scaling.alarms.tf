resource "aws_cloudwatch_metric_alarm" "scale_down" {
  alarm_name                = "scale-down"
  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = 3
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/ECS"
  period                    = 30
  statistic                 = "Average"
  threshold                 = 55
  alarm_description         = "This metric monitors ECS Service cpu utilization"
  insufficient_data_actions = []
  alarm_actions             = [aws_appautoscaling_policy.scale_down.arn]

  dimensions = {
    ClusterName = aws_ecs_cluster.this.name
    ServiceName = aws_ecs_service.this.name
  }
}

resource "aws_cloudwatch_metric_alarm" "scale_up" {
  alarm_name                = "scale-up"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/ECS"
  period                    = 30
  statistic                 = "Average"
  threshold                 = 60
  alarm_description         = "This metric monitors ECS Service cpu utilization"
  insufficient_data_actions = []
  alarm_actions             = [aws_appautoscaling_policy.scale_up.arn]

  dimensions = {
    ClusterName = aws_ecs_cluster.this.name
    ServiceName = aws_ecs_service.this.name
  }
}

