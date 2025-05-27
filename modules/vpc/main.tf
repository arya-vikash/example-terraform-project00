resource "aws_flow_log" "vpc_flow_logs" {
  log_destination      = aws_cloudwatch_log_group.vpc_flow_logs.arn
  traffic_type         = "ALL"
  vpc_id               = aws_vpc.main.id
  log_destination_type = "cloud-watch-logs"
  deliver_logs_permission_arn = aws_iam_role.vpc_flow_logs.arn
}

resource "aws_cloudwatch_log_group" "vpc_flow_logs" {
  name              = "/aws/vpc/${var.name}-${var.environment}-flow-logs"
  retention_in_days = 90
  tags = {
    Name        = "${var.name}-${var.environment}-vpc-flow-logs"
    Environment = var.environment
    Service     = "networking"
  }
}
