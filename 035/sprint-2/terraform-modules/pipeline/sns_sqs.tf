resource "aws_sns_topic_subscription" "new_order_integration" {
  topic_arn            = aws_sns_topic.new_order_topic.arn
  endpoint             = aws_sqs_queue.new_order_queue.arn
  protocol             = "sqs"
  raw_message_delivery = true
}
