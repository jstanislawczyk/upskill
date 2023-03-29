resource "aws_sns_topic" "new_order_topic" {
  name = "${var.environment}-${var.tenant}-new-order-topic"
}
