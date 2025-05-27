resource "aws_kms_key" "flow_log_key" {
  description             = "KMS key for encrypting VPC flow logs"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}
