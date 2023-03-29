resource "aws_sqs_queue" "new_order_queue" {
  name = "${var.environment}-${var.tenant}-new-order-queue"
}
